/// @param text_id
function scr_game_script(_text_id){

switch(_text_id){

	case"ncp 1":
				scr_text("A girl is glaring blankly at the surrounding ruins scanning for something. ")
				scr_text("Her eyes  look through you as though you're not even there.")
						scr_option("What's out there ? ","npc 1 - YAY")
						scr_option("Those robes look big on you.", "npc 1 - RAGE")
					
		break;
	case"npc 1 - YAY": 
		scr_text("What's out there ? ",  "key-keyless")
		scr_text("As you ask here a question about the Hollows here eyes light up")
		scr_text(" The hollows are filled with all sorts of stuff !", "Scheik-happy", -1)
		scr_text("These roots have been here from the very beginning! Since when the first star children created the world.",  "Scheik-happy", -1)
		scr_text(" It MAY look like there are bunch trees but these are actually 1 big tree leading all the way to the centre of Karra!",  "Scheik-happy", -1)
		scr_text("The deeper you go into the Hollow the thicker and more lively these roots are.",  "Scheik-happy", -1)
		scr_text(" though yes there are organisms in these higher layers of the hollow the ecosystems REALLY diversify to the lower levels..",  "Scheik-happy", -1)
		scr_text(" here you might find your basic small creatures like a Solaire beetle or Yaptaratorimisus . . . ",  "Scheik-happy", -1)
		scr_text("my master told me that  . . .",  "Scheik-happy", -1)
		scr_text(" . . . ", "Scheik-neutral", -1)
		scr_text("I . . . I dont have time to chat I work to do", "Scheik-neutral" , -1)
		scr_text("sorry", "Scheik-neutral", -1)
		scr_text("She gets at zooms across the bridge")
	break;
	
	case"npc 1 - RAGE": 
		scr_text("Those robes look big on you.", "key-keyless")
		scr_text("WHAT !  NO !", "Scheik-angry", -1)
			scr_text_shake(0, 13);
		scr_text("YOU'RE ONE TO TALK! HAVE YOU LOOKED AT YOUR SELF RECENTLY? ", "Scheik-angry", -1)
			scr_text_shake(0, 58)
		scr_text("THAT RAG OF A TUNIC IS MASSIVE!", "Scheik-angry", -1)
			scr_text_shake(0,31)
		scr_text("I don't have time to talk to wandering CHILDREN.", "Scheik-angry", -1)
			scr_text_shake(39,47)
		scr_text("I have IMPORTANT witch stuff to attend to.",  "Scheik-angry", -1)
			scr_text_wave(7,15)
		scr_text("hmm!",  "Scheik-angry", -1)
		scr_text("She gets at zooms across the bridge")
	break;
	case"cutscene":
				scr_text("The world is split into 2 parts The Crown and The Hollows","scene-1", 2)
				scr_text("These lands where home to 2 Kin Dragons and Humans ","scene-2", 2)
				scr_text("The 2 Kin fought for the crown, eventually the humans flead to The Hollows","scene-3", 2)
				scr_text("But humans weren’t willing to give up and discovered the power of breath","scene-4", 2)
				scr_text("They reemerged to The Crown and began the Dragon Crusades","scene-5", 2)
				scr_text("The Dragons became a memory but there still remained the Tarragon. Humans of dragon blood condemned to The Hollows","scene-6", 2)	
			
		break;
	case"m_dev-meeting":
			scr_text("Hiyya ! I made this game. You've made it to the end, I know. I know. short")
			scr_text("but hey cut me some slack rpgs take a while, it not like i had 8 years of development or anything")
			scr_text("I hope you atleast like what you did play")
			scr_text("Since this is the end ofthe game and I am the OMNIPOTENT GOD of this world you can ask me 1 question")
			scr_text("but be warned you must choose carfully as after this conversation the game will close ")
					scr_option("What does the key open? ","m_dev-answer1")
					scr_option("Is your favrite colour red? You're so red its weird","m_dev-answer2")
	break;
	case"m_dev-answer1":
			scr_text("What does the key open?", "key-keyless")
			scr_text("For what that key opens, i don't know but who created the seal ")
			scr_text("Sol God of the order of the singular sun after he won the battle against the dragons in the Dragon Crusades")
			scr_text("alright bye bye now ! : 3")
			
			break;
		case"m_dev-answer2":
			scr_text("Is your favrite colour red You're so red its weird",  "key-keyless")
			scr_text("No my favorite color is purple look at this game ITS ALL PURPLE! but the only colour that fits my unhinged personality is red")
			scr_text("you think I look weird? look at that tunic its MASSIVE you look weird I would know i made you and this dialog")
			scr_text("alright bye bye now ! : 3")
		break;
}
}