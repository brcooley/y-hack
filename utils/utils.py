#!/usr/bin/env python

import os
import smptlib
import sqlite3

from email.mime.text import MIMEText

FROM_EMAIL = 'estimately@gmail.com'
SMTP_SERVER = 'smtp.gmail.com:587'

def get_user(id):
	conn = sqlite3.connect('db/production.sqlite3') # TODO add database name here
	c = conn.cursor()

	c.execute('SELECT * FROM users WHERE id =:id ', {'id': id})
	user_data = c.fetchone()
	return user_data

def send_email(user_email, raw_template):

	msg = MIMEText(raw_template['body'], 'html')
	msg['Subject'] = raw_template['subject']
	msg['From'] = FROM_EMAIL
	msg['To'] = user_email

	s = smtplib.SMTP(SMTP_SERVER)
	s.starttls()
	s.login(FROM_EMAIL, os.environ['EMAIL_PASSWD'])
	s.sendmail(FROM_EMAIL, [user_email], msg.as_string())
	s.quit()

	return None