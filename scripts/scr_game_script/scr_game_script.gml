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
	case"ncp 2":
				scr_text("The world is split into 2 parts The Crown and The Hollows")
				scr_text("These lands where home to 2 Kin Dragons and Humans ")
				scr_text("The 2 Kin fought for the crown, eventually the humans flead to The Hollows")
				scr_text("But humans weren’t willing to give up and discovered the power of breath")
				scr_text("They reemerged to The Crown and began the Dragon Crusades")
				scr_text("The Dragons became a memory but there still remained the Tarragon. Humans of dragon blood condemned to The Hollows")

		break;

}

}