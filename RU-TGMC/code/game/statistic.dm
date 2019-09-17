proc/show_statistic(var/client/C, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	var/mob/user = C.mob
	var/list/data = list() //Fuck this shit i spent 2 hours just to write it
	data["total_projectiles_fired"] = GLOB.round_statistics.total_projectiles_fired
	data["total_bullets_fired"] = GLOB.round_statistics.total_bullets_fired
	data["total_xeno_deaths"] = GLOB.round_statistics.total_xeno_deaths
	data["total_human_deaths"] = GLOB.round_statistics.total_human_deaths
	data["total_xenos_created"] = GLOB.round_statistics.total_xenos_created
	data["total_humans_created"] = GLOB.round_statistics.total_humans_created
	data["total_bullet_hits_on_humans"] = GLOB.round_statistics.total_bullet_hits_on_humans
	data["total_bullet_hits_on_xenos"] = GLOB.round_statistics.total_bullet_hits_on_xenos
	data["total_larva_burst"] = GLOB.round_statistics.total_larva_burst
	data["carrier_traps"] = GLOB.round_statistics.carrier_traps
	data["weeds_planted"] = GLOB.round_statistics.weeds_planted
	data["weeds_destroyed"] = GLOB.round_statistics.weeds_destroyed
	data["grenades_thrown"] = GLOB.round_statistics.grenades_thrown
	data["queen_screech"] = GLOB.round_statistics.queen_screech
	data["now_pregnant"] = GLOB.round_statistics.now_pregnant
	data["xeno_list_alive"] = list()
	data["xeno_list_dead"] = list()
	data["human_list_alive"] = list()
	data["human_list_dead"] = list()
	for(var/mob/i in GLOB.alive_xeno_list)
		data["xeno_list_alive"] += list(list("ckey" = i.ckey, "name" = i.name, "stat" = "SURVIVED"))
	for(var/mob/i in GLOB.dead_xeno_list)
		data["xeno_list_dead"] += list(list("ckey" = "DEAD", "name" = i.name, "stat" = "DEAD"))
	for(var/mob/i in GLOB.alive_human_list)
		data["human_list_alive"] += list(list("ckey" = i.ckey, "name" = i.name, "stat" = "SURVIVED"))
	for(var/mob/i in GLOB.dead_human_list)
		data["human_list_dead"] += list(list("ckey" = "DEAD", "name" = i.name, "stat" = "DEAD"))
	src = C.mob
	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "statistics.tmpl", "Round End Statistics", 360, 800)
		ui.set_initial_data(data)
		ui.open()

/proc/show_stats_everybody()
	for(var/client/C in GLOB.clients)
		show_statistic(C)

