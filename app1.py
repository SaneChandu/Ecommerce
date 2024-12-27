from flask import Flask,render_template,request,flash,session,redirect,url_for
import mysql.connector
from otp import genotp
from cmail import sendmail
mydb=mysql.connector.connect(
    host='localhost',
    user='root',
    password='root',
    database='ecom'
)
app=Flask(__name__)
app.secret_key='hfbgfhghjg'
@app.route('/')
def base():
    return render_template('homepage.html')
@app.route('/admin_signup',methods=['GET','POST'])
def admin_signup():
    if request.method=='POST':
        name=request.form['name']
        mobile=request.form['mobile']
        email=request.form['email']
        address=request.form['address']
        password=request.form['password'] 
        cursor=mydb.cursor()
        cursor.execute('select email from admin')
        data=cursor.fetchall()
        cursor.execute('select mobile from admin')
        edata=cursor.fetchall()
        if(mobile,) in edata:
            flash('User already exist')
            return render_template('admin_signup.html')
        if(email,)in data:
            flash('Email address already exists')
            return render_template('admin_signup.html')
        cursor.close()
        otp=genotp()
        subject='thanks for registering to the application'
        body=f'use this otp to register {otp}'
        sendmail(email,subject,body)
        return render_template('otp.html',otp=otp,name=name,mobile=mobile,email=email,address=address,password=password)
    else:
        return render_template('admin_signup.html')
@app.route('/admin_login',methods=['GET','POST'])
def admin_login():
    if request.method=="POST":
        username=request.form['username']
        password=request.form['password'] 
        cursor=mydb.cursor()
        cursor.execute('select count(*) from admin where name=%s and password=%s',[username,password])
        count=cursor.fetchone()[0]
        print(count)
        if count==0:
            flash('Invalid email or password')
            return render_template('admin_login.html')
        else:
            session['user']=username
            if not session.get(username):
                session[username]={}
            return redirect(url_for('base'))
    return render_template('admin_login.html')
@app.route('/otp/<otp>/<name>/<mobile>/<email>/<address>/<password>',methods=['GET','POST'])
def otp(otp,name,mobile,email,address,password):
    if request.method=="POST":
        uotp=request.form['otp']
        if otp==uotp:
            cursor=mydb.cursor()
            lst=[name,mobile,email,address,password]
            query='insert into admin values(%s,%s,%s,%s,%s)'
            cursor.execute(query,lst)
            mydb.commit()
            cursor.close()
            flash('Details registered')
            return redirect(url_for('admin_login'))
        else:
            flash('Wrong otp')
    return render_template('otp.html',otp=otp,name=name,mobile=mobile,email=email,address=address,password=password)
@app.route('/logout')
def logout():
    if session.get('user'):
        session.pop('user')
        return redirect(url_for('base'))
    else:
        flash('already logged out!')
        return redirect(url_for('admin_login'))
app.run()