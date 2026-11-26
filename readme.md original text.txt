ნაწილი 1: კონტეინერების გაშვება და შესწავლა
1. ბრძანებით "docker run hello-world" ვამოწმებთ მუშაობს თუ არა dockerfile პროგრამა. თუ hello-world იმიჯი არ არის ლოკალურად, ავტომატურად ჩამოიტვირთება.
2. ინტერაქტიული ubuntu კონტეინერის გაშვება ბრძანებით "docker run -it ubuntu bash"(-i interactive,
-t terminal).
3. ბრძანებით " apt update" ჩაიტვირთება ხელმისაწვდომი პაკეტების სია, შემდეგ " apt install -y curl"-ით ჩამოიტვირთება curl ინსტრუმენტი, რომლითაც ინტერნეტთან კავშირი შემოწმდება ბრძანებით "curl -i https://google.com".
4.exit ბრძანებით გამოვალთ ubuntu-ს ტერმინალიდან.
5. ბრძანებით "docker ps -a" გამოვიტანთ ყველა კონტეინერს(გაშვებულსაც და გაჩერებულსაც), ამოვირჩევთ ერთ-ერთ პროცესს და წავშლით("docker rm <process id>"), თუმცა პირველ რიგში, ეს პროცესი უნდა შეწყდეს("docker stop <process id>"), რადგან აქტიური პროცესი არ წაიშლება.
ჩანს, რომ კონტეინერი , რომლის id არის 0f8ff56c8ff5, წაიშალა.

ნაწილი 2: საკუთარი Python აპლიკაციის იმიჯის შექმნა (Build)
6.საქაღალდის შექმნა "mkdir docker-prjct" და ამ საქაღალდეში გადასვლა "cd docker-prjct".
7.მარტივი python სკრიპტის შექმნა "echo print("I hope i will get good points") > docker.py".
8. dockerfile-ის შემქნა "notepad dockerfile". პირდაპირ notepad-ში გაიხსნება ახალი ფაილი და ჩაიწერება კოდი(თუმცა შენახვისას უნდა მიეთითოს all file type ნაცვლად txt-ისა ). ვირჩევთ python-ის კონკრეტულ ვერსიას, ამ შემთხვევაში python: 3.11-slim მისი სტაბილურობისა და კომპაქტურობის გამო. dir ბრძანებით გამოვიტანთ დირექტორიებს, რომ დავრწმუნდეთ dockerfile-ს არ აქვს .txt გაფართოოება და თუ აქვს, მაშინ "ren dockerfile.txt dockerfile" ბრძანებით შევცვლით სახელს.
9.(Build) Docker იმიჯის აწყობა ბრძანებით "docker build -t python-app ." მიმდინარე საქაღალდეში. Tag ნაგულისხმევად არის [:latest].
10.კონტეინერის გაშვება შექმნილი იმიჯიდან "docker run python-app" ბრძანებით. (გამოიტანს python სკრიპტს)
11.იმიჯისთვის tag-ის მინიჭება და ყველა იმიჯის სიის გამოტანა ბრძანებებით "docker tag python-app python-app:test" და "docker images".

ნაწილი 3: Docker Volume-ების გამოყენება მონაცემების შესანახად
12. სახელდებული (Named) Docker Volume-ის შექმნა ბრძანებით "docker volume create Evolume"
13.კონტეინერის გაშვება მიბმული (Mounted) Volume-ით "docker run -it --name container_1 -v Evolume:/portal ubuntu bash" ბრძანებით. შეიქმნება და გაეშვება ახალი ubuntu კონტეინერი container_u და ყველაფერი, რაც ამ კონტეინერის საქაღლდე /portal-ში ჩაიწერება შეინახება Evolume-ში. შესაბამისად, კონტეინერის წაშლის შემთხვევაში ინფორმაცია არ დაიკარგება.
14. კონტეინერში /portal დირექტორიაში გადასვლა "cd /portal", მასში ფაილის შექმნა და შენახვა ბრძანებით "echo portal is open > one.txt", ხოლო "cat one.txt" ბრძანებით შემოწმება, რომ ნამდვილად შეინახა. გამოსვლა "exit" ბრძანებით.
15. სხვა კონტეინერის გაშვება იმავე Volume-ის გამოყენებით და იმის დასადასტურებლად, რომ ფაილი შენახულია. ბრძანებები "docker run -it --name container_2 -v Evolume:/portal ubuntu bash", შემდეგ "cd /portal"  და " cat one.txt".