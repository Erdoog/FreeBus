import firebase_admin
from firebase_admin import credentials
from firebase_admin import db

cred = credentials.Certificate("freebus-35e59-firebase-adminsdk-ttqu4-23bbaa30e0.json")
firebase_admin.initialize_app(cred, {
    'databaseURL': 'https://freebus-35e59-default-rtdb.asia-southeast1.firebasedatabase.app/'
})

ref = db.reference('buses')
ref.set({
    '124': {
        '1': {
            'person_count': '0',
            'capacity': '24',
            'location': 'Seyfulina Al-Farabi'
        }
    }
})
