import tkinter as tk
import random
import webbrowser
import os
import sys

global coins
coins = 3

def choose1():
    global chosen
    chosen = 1
    submit()

def choose2():
    global chosen
    chosen = 2
    submit()

def choose3():
    global chosen
    chosen = 3
    submit()

def submit():
    global coins
    cup1.config(state="disabled")
    cup2.config(state="disabled")
    cup3.config(state="disabled")
    reveal()

def reveal():
    global coins
    global solution
    solution = random.randint(1, 3)
    if solution == 1:
        cupis1()
    if solution == 2:
        cupis2()
    if solution == 3:
        cupis3()

    if chosen == solution:
        coins += 2
        coincounter.config(text=f"Coins: {coins}", fg="green")
        root.after(500, reset)

    else:
        coins -= 1
        coincounter.config(text=f"Coins: {coins}", fg="red")
        root.after(500, reset)

def reset():
    global coins
    coincounter.config(fg="black")
    cup1.config(state="active")
    cup2.config(state="active")
    cup3.config(state="active")
    cupdisp1.config(image=cupimg)
    cupdisp2.config(image=cupimg)
    cupdisp3.config(image=cupimg)

def cupis1():
    cupdisp1.config(image=cupimg2)

def cupis2():
    cupdisp2.config(image=cupimg2)

def cupis3():
    cupdisp3.config(image=cupimg2)

def websitevisit():
    url = "https://sites.google.com/view/rust865"
    webbrowser.open(url)


def resource_path(relative_path):
    try:
        base_path = sys._MEIPASS
    except Exception:
        base_path = os.path.abspath(".")

    return os.path.join(base_path, relative_path)

root = tk.Tk()
root.title("Scup!")
root.iconbitmap(resource_path("icon.ico"))

logo = tk.Label(root, text="Scup!", fg="teal", font=("Roboto", 30))
logo.pack()

author = tk.Label(root, text="by dk865", fg="grey", font=("Roboto", 15))
author.pack(pady=5)

instructions = tk.Label(root, text="Guess where the Coin is by pressing a button!", font=("Roboto", 8))
instructions.pack()

coincounter = tk.Label(root, text=f"Coins: {coins}", font=("Roboto", 15))
coincounter.pack()

cupimgframe = tk.Frame(root)
cupimgframe.pack()
cupimg = tk.PhotoImage(file=resource_path("cup.png"))
cupimg2 = tk.PhotoImage(file=resource_path("cup1.png"))
cupdisp1 = tk.Label(cupimgframe, image=cupimg)
cupdisp2 = tk.Label(cupimgframe, image=cupimg)
cupdisp3 = tk.Label(cupimgframe, image=cupimg)
cupdisp1.pack(side="left")
cupdisp2.pack(side="left")
cupdisp3.pack(side="left")

cupframe = tk.Frame(root)
cupframe.pack()
cup1 = tk.Button(cupframe, text="Cup 1", command=choose1)
cup2 = tk.Button(cupframe, text="Cup 2", command=choose2)
cup3 = tk.Button(cupframe, text="Cup 3", command=choose3)

cup1.pack(side="left", padx=5, pady=10)
cup2.pack(side="left", padx=5, pady=10)
cup3.pack(side="left", padx=5, pady=10)

websitelink = tk.Button(text="Visit My Website!", fg="teal", command=websitevisit)
websitelink.pack(pady=10)

root.mainloop()