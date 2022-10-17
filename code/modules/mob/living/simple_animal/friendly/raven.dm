
///the perfectly normal raven.
/mob/living/simple_animal/pet/raven
	name = "raven"
	desc = "Quoth the raven nevermore! Just now in space!"
	icon = 'icons/mob/animal.dmi'
	icon_state = "raven"
	icon_living = "raven"
	icon_dead = "raven_dead"
	speak_emote = list("caws")
	health = 7
	maxHealth = 7
	attacktext = "bites"
	melee_damage_lower = 2
	melee_damage_upper = 2
	turns_per_move = 5
	response_help  = "pets"
	response_disarm = "shoos"
	response_harm   = "kicks"
	ventcrawler = VENTCRAWLER_ALWAYS
	density = FALSE
	pass_flags = PASSTABLE | PASSMOB
	can_hide = TRUE
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat = 2)
	can_collar = TRUE
	gold_core_spawnable = FRIENDLY_SPAWN
		///This varible allows you to set a cooldown on an ability, for an example usage reference the raven.dm, last line.
	var/caw_cooldown
///a unique raven pet
/mob/living/simple_animal/pet/raven/nevermore
	name = "Nevermore"
	desc = "The coroner's pet. Reminds us that peace and quiet is coming for us all."
	gold_core_spawnable = NO_SPAWN
	unique_pet = TRUE

/mob/living/simple_animal/pet/raven/npc_safe(mob/user)//Makes the raven a playable via the ghost menu.
	return TRUE

/mob/living/simple_animal/pet/raven/verb/perch()//The raven category is established here, as well as the fly and take off button
	set name = "Fly/Take off!"
	set category = "Raven"
	set desc = "Sit on a nice comfy perch."

	if(icon_state == "raven")//Changes the state to the flying animation if the check returns true.
		icon_state = "raven_fly"//The ravens flying animation, Later in my refactor I intend on making this a varible for perch()
	else
		icon_state = "raven"

/mob/living/simple_animal/pet/raven/verb/caw()//The raven caw ability button
	set name = "Caw!"
	set category = "Raven"
	set desc = "caws"

	if(caw_cooldown < world.time) // A caw_cooldown, to stop people being jerks
		playsound(loc, 'sound/creatures/caw.ogg', 50, 1)
		caw_cooldown = world.time  + 2 SECONDS




