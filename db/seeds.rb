require 'uri'
require 'faker'

puts 'Creating journalists...'
journalist = User.create(email: 'mrfake@fakenews.com', password: 'password', password_confirmation: 'password',
                         first_name: 'Mr.', last_name: 'Fake', role: 5)
(0..5).each do |_i|
  User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name, role: 5)
end

puts 'Creating subscribers...'
subscriber = User.create(email: 'subscriber@gmail.com', password: 'password', password_confirmation: 'password',
                         first_name: 'Bob', last_name: 'Kramer', role: 2)
(0..5).each do |_i|
  User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name, role: 2)
end

puts 'Creating editor....'
editor = User.create(email: 'editor@gmail.com', password: 'password', password_confirmation: 'password',
                     first_name: 'Sam', last_name: 'Kramer', role: 10)

article_seeds = [
  {
    title: 'Five ways to keep the government from spying on you',
    teaser: 'A new round of documents regarding government surveillance was unveiled by WikiLeaks on Tuesday, alleging that the Central Intelligence Agency hacks smartphones, computers and connected TVs to spy on American citizens and others around the world. (The CIA declined a request for comment.)',
    body: "To be clear, the techniques released in these documents are “very targeted,” said Sydney, Australia-based security researcher Troy Hunt. “Authorities would want to have a very good reason to use those techniques and the vast majority of people are outside the scope of what they’d be used for,” he said.\nStill, the revelations are not the first to suggest the government is surveilling citizens — in fact, they aren’t much different from the documents National Security Agency contractor Edward Snowden leaked in 2013, according to Mark Weinstein, a privacy advocate and chief executive officer of social network MeWe. He said each new round of revelations fuels the growing anxiety U.S. citizens have about being watched. “People are feeling an overwhelming sense of being creeped out by the aggregate of these stories,” he said.\nFor average citizens starting to think about how to keep their communications out of reach of Big Brother, here are some of the ways to lock down devices and keep government entities, advertisers and corporations out of your daily lives.\nUse encrypted communication\n.'\n'To avoid surveillance — by governments or others users — you should switch to more secure apps for messaging, like Signal, which is free for download on iTunes and Google Play. The app, which is recommended by Snowden himself to avoid surveillance, allows users to send encryption-protected information to others who also use the app and collects and stores very little data about users.\nWhatsApp, for example, is also encrypted but does store metadata — the information about who you are messaging and where, and is owned by Facebook FB, -0.78%  . (Facebook did not reply to request for comment.)\nSimilarly, iMessage is encrypted by default, but Apple AAPL, -0.16% still stores metadata on user conversations for up to 30 days and can hand the information over to law enforcement with a warrant. Messaging on iPhone is also only encrypted between two iPhone users, so texting Android users will revert messages to unencrypted SMS.\nApple had a standoff with law enforcement over equipping devices with so-called “back doors” to enable them to access user information. The issue came to a boiling point when Apple refused to help the Federal Bureau of Investigation unlock the iPhone of the man who carried out a mass shooting in San Bernardino, Calif. in 2016.",
    image: 'https://ei.marketwatch.com/Multimedia/2017/03/09/Photos/ZG/MW-FH691_truman_20170309110203_ZG.jpg?uuid=bc621fac-04e1-11e7-bb7d-001cc448aede',
    category: 'Politics'
  },
  {
    title: 'Why the Earth is actually 100% flat',
    teaser: "Rapper B.o.B. has been criticised for publicly insisting the Earth is flat. You may think his claims are ludicrous, but the truth is: they don't go far enough",
    body: "Bobby Ray Simmons Jr, better known as BoB, American rapper and music producer, believes that the Earth is flat, according to recent tweets from his account.\nThe rapper – who has released hits Nothin' on You, Airplanes and Magic – posted dozens of tweets, presenting a variety of arguments as to why modern science is wrong.\nFlat earth rapper BoB releases Neil deGrasse Tyson diss track\nRead more\n'A lot of people are turned off by the phrase 'flat earth' ... but there's no way u can see all the evidence and not know... grow up,' he tweeted.\nHe argued that if the Earth were indeed curved, evidence of that would be apparent when looking at the horizon in the distance and distant cities would be hidden from view because of curvature.\n'No matter how high in elevation you are... the horizon is always eye level ... sorry cadets... I didn't wanna believe it either,' the rapper tweeted.",
    image: 'https://i.guim.co.uk/img/media/c9c2a7488f3c3a51100320a8aaaf47043066c54c/0_191_2999_1805/master/2999.jpg?width=620&quality=85&auto=format&fit=max&s=06fd336d2b906eda97f36866ccc2ee05',
    category: 'Science'
  },
  {
    title: 'The Dark Virality of a Hollywood Blood-Harvesting Conspiracy',
    teaser: 'A centuries-old anti-Semitic myth is spreading freely on far-right corners of social media—suggesting a new digital Dark Age has arrived.',
    body: "THE DARK AGES were rife with plague, fanaticism, and accusations that Jews secretly fed off the blood of children. In 2020, we too are beset with plague, rampant medical misinformation, and a persistent rumor that 'global elites' torture children to harvest the chemical adrenochrome from their blood, which they then inject in order to stay healthy and young.\nA favorite topic of interconnected QAnon and Pizzagate conspiracy communities, so-called 'adrenochrome harvesting' long predates these groups. It has, however, resurrected during the Covid-19 pandemic. Google Trends shows significant spikes in searches for adrenochrome in March and June of 2020. It's prevalent on TikTok, Youtube, and Instagram. Reddit removed a dedicated adrenochrome subreddit on July 30. On Friday, July 31, conspiracy theorists plan to hold the first 'Child Lives Matter' protest in Hollywood to 'expose' child trafficking, advertising the event with references to #adrenochrome.",
    image: 'https://media.wired.com/photos/5f234f754e40ec8b2a384b62/master/w_2560%2Cc_limit/OpEd-Blood-85758144.jpg',
    category: 'Hollywood'
  },
  {
    title: "'Texas Ranger' Chuck Norris warns of government plot to take over state",
    teaser: 'Actor, martial arts master and conservative questions US military training exercise and praises Ted Cruz for refusal to believe Jade Helm 15 is no threat',
    body: "The actor, martial artist, and internet meme Chuck Norris has warned of a federal government plot to take over the state of Texas.\nWriting on the right-wing website WND, or WorldNetDaily, Norris discussed the potential for Jade Helm 15, a US military training exercise planned for July and August, to turn into a full-scale occupation of his home state.\nExercises will be held in Texas and six other states during Jade Helm 15, across public and private land. The training has been the focus of rightwing conspiracy theories since a map published for the purpose of the simulation labelled Texas, Utah and California as 'hostile'.\n'The US government says, 'It's just a training exercise',' wrote Norris, 75. 'But I'm not sure the term 'just' has any reference to reality when the government uses it.'\nBoth the governor of Texas, Greg Abbott, and US senator – and 2016 Republican presidential candidate – Ted Cruz have been accused of pandering to conspiracy theorists with their reactions to Jade Helm 15. Abbott asked the Texas state guard to monitor the training exercise. Cruz said his office had 'reached out to the Pentagon' to ask about the exercise.\nNorris, who appeared as Texas Ranger JJ McQuade in the 1983 film Lone Wolf McQuade and starred in the long-running TV series Walker, Texas Ranger, praised both men for their refusal to believe official government accounts.\n'I'm glad … Ted Cruz is asking the tough questions of the Pentagon,' Norris wrote. 'Particularly because its 'exercises' come too near to my ranch's backdoor as well, at least according to the map.\n'It's pretty sad and bad when major military ops are ordered in a large, fiery state like Texas and not even the governor or its senators know the specifics.'\nIn the article Norris, who has been awarded a black belt across numerous martial arts disciplines, quotes 'affable antique store owner' Mike Hightower as being among those concerned about the exercises.\n'I'm not trusting what we're being told,' warns Hightower, who lives in Smithville, Texas, where some of the training exercise will take place. 'I think there's something a little more involved than what they're telling us.'\nWND is no stranger to conspiracy theories. It has published articles questioning Barack Obama's status as an American citizen and among its contributors is the rightwing blogger Pamela Geller, president of the group that hosted the 'draw the prophet Muhammad' event at which two gunmen were killed near Dallas on Sunday.\nNorris, who is known for his political conservatism, also used his article to file a brief report on a recent gala held by his karate foundation, Kickstart for Kids. Governor Abbott and his wife Cecilia were in attendance, he wrote.\n'It was an amazing night and gala!' Norris added.",
    image: 'https://i.guim.co.uk/img/static/sys-images/Guardian/About/General/2013/1/31/1359654827665/Chuck-Norris-in-The-Expen-011.jpg?width=620&quality=85&auto=format&fit=max&s=f89c85dffd672b76b553a3537ba95add',
    category: 'Hollywood'
  },
  {
    title: "The Government Literally Just Admitted It's Taking UFOs Seriously",
    teaser: "And, according to researchers, it's only pretended to end the program. So much of what the program uncovered remains classified, but what little we know is tantalizing.",
    body: "In 1952, a CIA group called the Psychological Strategy Board concluded that, when it came to UFOs, the American public was dangerously gullible and prone to 'hysterical mass behavior.' The group recommended 'debunking' campaigns to tamper the public's interest in unexplained phenomena. But the government seems to have been interested, too: In December, the Pentagon confirmed the existence of the Advanced Aerospace Threat Identification Program. Created in 2007 by senators Ted Stevens (who reported being chased by a mysterious object), Daniel Inouye, and then–Majority Leader Harry Reid, and funded with $22 million of 'black money' from the Department of Defense's budget, the program investigated and evaluated reports of UFO sightings, many of which came from American service members.\nSo much of what the program uncovered remains classified, but what little we know is tantalizing. Based on data it collected, the program identified five observations that showed mysterious objects displaying some level of 'advanced physics,' also known as 'stuff humans can't do yet': The objects would accelerate with g-forces too strong for the human body to withstand, or reach hypersonic speed with no heat trail or sonic boom, or they seemed to resist the effects of Earth's gravity without any aerodynamic structures to provide thrust or lift. 'No one has been able to figure out what these are,' said Luis Elizondo, who ran the program until last October, in a recent interview.\nElizondo has also talked about 'metamaterials' that may have been recovered from unidentified aerial phenomena and stored in buildings owned by a private aerospace contractor in Las Vegas; they apparently have material compositions that aren't found naturally on Earth and would be exceptionally expensive to replicate. According to a 2009 Pentagon briefing summarized in the New York Times, 'the United States was incapable of defending itself against some of the technologies discovered.' This was a briefing by people trying to get more funding — but still.",
    image: 'https://pyxis.nymag.com/v1/imgs/424/38f/c8d233a6fc271d8b969e6bd1261781afff-19-aliens-2.w710.jpg',
    category: 'Science'
  },
  {
    title: "Harry Reid Says We're Not Taking Them Seriously Enough",
    teaser: 'The former Senate majority leader is definitely a truther. Amasing insights to military UFO secrets',
    body: "Eric Benson: I'm curious about just where your interest in this subject comes from.\nHarry Reid: Bob Bigelow [the founder of Bigelow Aerospace and Budget Suites]. He's a central figure in all this. When he was a young man, he heard a story from his grandparents about driving down from Mt. Charleston, near Las Vegas, where they saw a so-called flying saucer, for lack of a better description. Bob became a very wealthy man. He would pay for these conferences about UFOs, and he would bring in scientists, academics, and a few nutcases.\nThere were people trying to figure out what all this aerial phenomena was. Bob started sending me tons of stuff. Mainly what interested me is that so many people had seen these strange things in the air.\nEB: So tell me how this program got started.\nHR: I was in Washington in the Senate, and Bob called me and said, 'I got the strangest letter here. Could I have a courier bring it to you?' I said sure. He didn't want to send it to me over the lines, for obvious reasons.\nThe letter said, 'I am a senior, longtime member of this security agency, and I have an interest in what you've been working on. I also want to go to your ranch in Utah.'\nBigelow had bought a great big ranch. All this crazy stuff goes on up there — you know, things in the air. Indians used to talk about it, part of their folklore.\nSo I called Bigelow back and said, 'Hey, I'll meet with the guy.' The program grew out of that, to study aerial phenomena.\nWe decided it would be [funded by] black money. I wanted to get something done. I didn't want a debate where no one knew what the hell they were talking about on the Senate floor.\nEB: I saw that you tweeted, 'We don't know the answers, but we have plenty of evidence to support asking the questions.' To you, what's the most compelling evidence to support asking the questions?\nHR: Read the reports. We have hundreds of — Eric, two, three weeks ago, maybe a month now, up in Montana, they had another strange deal at a missile base up there. It goes on all the time.\nEB: Do you know things about this program that you can't discuss publicly?\nHR: Yeah.",
    image: 'https://bostonglobe-prod.cdn.arcpublishing.com/resizer/WlSptefGvj0Jf6mSg7aLVtYwjSc=/1024x0/arc-anglerfish-arc2-prod-bostonglobe.s3.amazonaws.com/public/6YVLJZDJ4EI6JIYFC3H4TTETXU.jpg',
    category: 'Politics'
  },
  {
    title: 'Scientists Are Suddenly Much More Bullish About the Possibility of Life Out There',
    teaser: 'Just 30 years ago, we had not discovered a single planet outside our solar system. Now we know of more than 3,000 of them, and we know nearly every star in the night sky has at least one planet in its orbit.',
    body: "Just 30 years ago, we had not discovered a single planet outside our solar system. Now we know of more than 3,000 of them, and we know nearly every star in the night sky has at least one planet in its orbit. 'Even people who are not terribly interested in science know that we've found that planets are as common as fire hydrants — they're everywhere,' says Seth Shostak, the senior astronomer at the SETI Institute. 'One in five or one in six might be a planet similar to the Earth.'\nThat doesn't mean we'll ever find an exact replica of Earth, but maybe we don't have to. Our study of other planets and moons in the solar system shows us many worlds possess the ingredients necessary for life — an atmosphere, organic compounds, liquid water, and other necessities. (The moons orbiting Jupiter and Saturn, for example, feature whole subsurface oceans.)\nAnd even though these places are extremely harsh environments, that doesn't mean as much as we might once have thought it did; recent discoveries on Earth itself demonstrate that life is much tougher than we thought. We've found organisms in blisteringly hot geysers in Yellowstone National Park, in the darkest crevices under the most ungodly pressures in the deep ocean, in dry hellscapes like the Atacama Desert in Chile (an analogue for Mars). These 'extremophiles' don't need a warm and fuzzy paradise to call home — in fact, they have already evolved to live in environments as harsh as those on other planets. Some, like tardigrades, can even survive the bleak vacuum of space itself. If there's life in most of those places, 'it's going to be pond scum,' says Shostak. 'But it's alien pond scum. It shows that biology is all over.'\nAnd where there's biology, there may well be intelligence, and our increasing understanding of evolution also tells us life can evolve faster than we ever anticipated. Millions of years is a long time for us, but it's the blink of an eye on the cosmic scale. Blink too fast, and you'll miss that pond scum turning into an intelligent civilization sending out messages every which way, looking for friends.\nAnd we're now at the point where we could one day find those messages and send a reply. New technology gives us a better chance to actually make contact with extraterrestrials. Our radio telescopes can scan more of the night sky for an intelligent message than ever before. Our optical telescopes and observatories can peer farther into space and look for new planets, moons, and perhaps even signs of something altogether artificial (see 'Tabby's Star'). Our ability to parse volumes of data in mere seconds means we could conceivably survey much of the galaxy in just a few decades. That's why, in the past few years, Shostak has continually bet a cup of coffee with everyone he knows that humans will find aliens by around 2029. 'We'd have to be dead above the neck if we weren't interested in this,' says Penelope Boston, the director of the NASA Astrobiology Institute.",
    image: 'https://s.yimg.com/ny/api/res/1.2/_I7Mq5RDxwMM7qcspYe5UA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTg3Ny4yOTIzMDc2OTIzMDc2O2NmPXdlYnA-/http://globalfinance.zenfs.com/en_us/Finance/US_AFTP_SILICONALLEY_H_LIVE/There_may_be_far_far-4d6c81db0a3aca6992d8b1a90c3ac2d9',
    category: 'Aliens'
  },
  {
    title: "That 'Asteroid' Looks an Awful Lot Like a Rocket Ship",
    teaser: 'For science-minded SETI freaks, the last decade has been a particularly exciting one.',
    body: "We May Have Just Seen an Actual Flying Saucer\nWhen 'Oumuamua — the name means 'first messenger' in Hawaiian — was discovered floating through the solar system in October, SETI nuts immediately started checking the boxes that suggested the rod-shaped object might be an alien spacecraft of some kind. After all, it's the first interstellar object we've ever seen pass through the solar system. UFO enthusiasts point out that rods (along with flying saucers) are the two most common shapes cited by witnesses in UFO sightings, and the cigar shape would allow it to be slim enough to avoid collision with other objects as well as maximize aerodynamics for travel. Both the SETI Institute and the Breakthrough Listen initiative pointed their instruments toward the object but found no unusual signals emitting from it. Of course, maybe it's an ancient relic from an interstellar civilization, or maybe the aliens just weren't interested in making contact (that asteroid-ness could've just been camouflage). With the object on its way out of the solar system, we may never know.",
    image: 'https://pyxis.nymag.com/v1/imgs/f14/7bd/13d327e1559d0d3e0f4fdefaff8f118fe2-19-aliens-9.w710.jpg',
    category: 'Aliens'
  },
  {
    title: 'There Have Been Enough Well-Known Encounters to Fill Encyclopedias',
    teaser: 'Initially it looked like nonsense, until a few scientists noticed its resemblance to Zeta Reticuli, a system inside the constellation Reticulum largely unknown in that year. ',
    body: "Barney and Betty Hill's Abduction\nThe Hills (above) claimed that in 1961 a bright light swooped over their car on a New Hampshire road and that they woke up a few hours later and the car had been 'magnetized.' With regressive hypnosis, both were able to recall being abducted and probed by the little gray men, which soon became the de facto alien description. (The Hills' captors were, interestingly, very similar to Selenites — the five-foot moon inhabitants H.G. Wells invented for The First Men in the Moon.) Betty astonished authorities when she began drawing a map of the constellation the creatures claimed to be from. Initially it looked like nonsense, until a few scientists noticed its resemblance to Zeta Reticuli, a system inside the constellation Reticulum largely unknown in that year. Their case generated widespread publicity, partly because they were a mixed-race couple in the '60s, and turned into the flagship example of a 'close encounter,' though not until years after the fact (skeptics argue the delayed report is a sign it's a hoax). The hype ultimately culminated in The UFO Incident, a 1975 made-for-TV movie starring James Earl Jones and Estelle Parsons.",
    image: 'https://pyxis.nymag.com/v1/imgs/95e/60a/d3d8d461a7403d5c733bc587c24418f3fe-19-aliens-17.w710.jpg',
    category: 'Aliens'
  },
  {
    title: 'Meet the Man Who Started the Illuminati',
    teaser: 'How did a Bavarian professor end up creating a group that would be at the center of two centuries of conspiracy theories?',
    body: "The 18th-century German thinker Adam Weishaupt would have been stunned if he had known his ideas would one day fuel global conspiracy theories, and inspire best-selling novels and blockbuster films.\nUntil he was 36, the vast majority of his compatriots would have been equally stunned to discover that this outwardly respectable professor was a dangerous enemy of the state, whose secret society, the Illuminati, was seen to threaten the very fabric of society.\nBorn in 1748 in Ingolstadt, a city in the Electorate of Bavaria (now part of modern-day Germany), Weishaupt was a descendant of Jewish converts to Christianity. Orphaned at a young age, his scholarly uncle took care of his education, and enrolled him in a Jesuit school. After completing his studies, Weishaupt became a professor of natural and canon law at the University of Ingolstadt, married, and started a family. On the surface, it was a conventional enough career—until 1784 when the Bavarian state learned of his incendiary ideas.\nA closer look at his upbringing, however, reveals that Weishaupt always had a restless mind. As a boy he was an avid reader, consuming books by the latest French Enlightenment philosophers in his uncle's library. Bavaria at that time was deeply conservative and Catholic. Weishaupt was not the only one who believed that the monarchy and the church were repressing freedom of thought.\nConvinced that religious ideas were no longer an adequate belief system to govern modern societies, he decided to find another form of 'illumination,' a set of ideas and practices that could be applied to radically change the way European states were run.\nFreemasonry was steadily expanding throughout Europe in this period, offering attractive alternatives to freethinkers. Weishaupt initially thought of joining a lodge. Disillusioned with many of the Freemasons' ideas, however, he became absorbed in books dealing with such esoteric themes as the Mysteries of the Seven Sages of Memphis and the Kabbala, and decided to found a new secret society of his own.",
    image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Great_Seal_of_the_United_States_%28reverse%29.svg/1280px-Great_Seal_of_the_United_States_%28reverse%29.svg.png',
    category: 'Illuminati'
  }
]

puts 'Spreading the truth...'
  article_seeds.each do |article_seed|
    article = Article.create(title: article_seed['title'], teaser: article_seed['teaser'], body: article_seed['body'], created_at: (DateTime.now - rand(7)),
                           category: article_seed['category'], user_id: journalist.id, premium: [true, false].sample, published: true)
  Rating.create(user_id: journalist.id, article_id: article.id, rating: [1, 2, 3, 4, 5].sample)
end

puts 'My opinion is gospel...'
Article.where(backyard: false).each do |article|
  rand(4).times { article.comments.create(body: Faker::ChuckNorris.fact, user_id: User.where(role: 2).sample.id) }
end

puts 'Attaching truthful images to articles...'
Article.all.each_with_index do |article, index|
  file = URI.open(image_url[index])

  article.image.attach(io: file, filename: 'article_image.jpg', content_type: 'image/jpg')
end

# themes = %w[Science Aliens Covid Trump Cats CIA Singles]

# puts 'Generating valid insights...'
# (0...titles.count).each do |i|
#   backyard_article = Article.create(title: titles[i], body: body[i], backyard: true, location: %w[Sweden Denmark].sample,
#                                     theme: themes[i], user_id: subscriber.id)
# end
