// abort script for cutscene 51 (attack on the Yawning Portal)

void main()
{
    object oPC = GetLastPCToCancelCutscene();

    object oArea = GetArea(oPC);
    //Should probably loop through all PCs and blackscreen them.

    BlackScreen(oPC);


    //Objects
    object oPlayers;
    object oWellDoor = GetObjectByTag("q2a_door_welltop");

    object oGlim = GetObjectByTag("cut1_glim");
    object oLaf = GetObjectByTag("cut1_lafontaine");
    object oParley = GetObjectByTag("cut1_parley");
    object oTomi = GetObjectByTag("pre_tomi");
    object oDaelan = GetObjectByTag("pre_daelan");
    object oLinu = GetObjectByTag("pre_linu");
    object oSharwyn = GetObjectByTag("pre_sharwyn");

    object oDurnan = GetObjectByTag("q2adurnan");
    object oTamsil = GetObjectByTag("Tamsil1");
    object oPap = GetObjectByTag("cut1_pappilon");

    //locations
    location lDrowStart1 = GetLocation(GetWaypointByTag("wp_cut5_doorspawn"));
    location lDrowStart2 = GetLocation(GetWaypointByTag("wp_cut5_doorspawn"));
    location lDrowAttack1 = GetLocation(GetWaypointByTag("wp_cutdrowattack_1"));
    location lDrowAttack2 = GetLocation(GetWaypointByTag("wp_cutdrowattack_2"));
    location lDrowAttack3 = GetLocation(GetWaypointByTag("wp_cutdrowattack_3"));
    location lDrowAttack4 = GetLocation(GetWaypointByTag("wp_cutdrowattack_4"));
    location lDrowAttack5 = GetLocation(GetWaypointByTag("wp_cutdrowattack_5"));
    location lDrowAttack6 = GetLocation(GetWaypointByTag("wp_cutdrowattack_6"));

    //Cutscene attackers
    //Check to see if the cutscene attackers have been created already -
    //if not - create them at their finish locations else jump them to their finish locations


    object oDwarWar1 = GetObjectByTag("cut1yp_dwar1");
    if (GetIsObjectValid(oDwarWar1) == FALSE)
        oDwarWar1 = CreateObject(OBJECT_TYPE_CREATURE, "cut1yp_dwar1", lDrowAttack1);
    else
        AssignCommand(oDwarWar1, JumpToLocation(lDrowAttack1));

    object oDwarWar2 = GetObjectByTag("cut1yp_dwar2");
    if (GetIsObjectValid(oDwarWar2) == FALSE)
        oDwarWar2 = CreateObject(OBJECT_TYPE_CREATURE, "cut1yp_dwar1", lDrowAttack2);
    else
        AssignCommand(oDwarWar2, JumpToLocation(lDrowAttack2));

    object oDwarCleric1 = GetObjectByTag("cut1_dwarcleric1");
    if (GetIsObjectValid(oDwarCleric1) == FALSE)
        oDwarCleric1 = CreateObject(OBJECT_TYPE_CREATURE, "cut1_dwarcleric1", lDrowAttack3);
    else
        AssignCommand(oDwarCleric1, JumpToLocation(lDrowAttack3));

    object oDwarWiz1 = GetObjectByTag("cut1_dwizgen1");
    if (GetIsObjectValid(oDwarWiz1) == FALSE)
        oDwarWiz1 = CreateObject(OBJECT_TYPE_CREATURE, "cut1yp_dwar1", lDrowAttack5);
    else
        AssignCommand(oDwarWiz1, JumpToLocation(lDrowAttack5));

    //vfx target
    object oDarkness = GetObjectByTag("q2a_darktarget");

    object oLafStart = GetWaypointByTag("wp_cutatk_4adv_2");
    object oParleyStart = GetWaypointByTag("wp_cutatk_4adv_3");


    AssignCommand(oWellDoor, ActionOpenDoor(oWellDoor));


    //Fire a lighting bolt or something at Papillon, killing him (coming from the freshly blasted door)
    if (GetIsObjectValid(oPap) == TRUE)
        DestroyObject(oPap);

    //Create a couple drow near the now destroyed door and they will
    //come in to the main area of the inn.
    if (GetIsObjectValid(GetObjectByTag("cut5_drow1")) == FALSE)
    {
        CreateObject(OBJECT_TYPE_CREATURE, "cut5_drow1", lDrowStart1);
    }
    if (GetIsObjectValid(GetObjectByTag("cut5_drow2")) == FALSE)
    {
        CreateObject(OBJECT_TYPE_CREATURE, "cut5_drow2", lDrowStart1);
    }
    if (GetIsObjectValid(GetObjectByTag("cut5_drowwiz1")) == FALSE)
    {
        CreateObject(OBJECT_TYPE_CREATURE, "cut5_drowwiz1", lDrowStart1);
    }


    //Make sure NPCs are in position
    if (GetIsDead(oLaf) == FALSE)
    {
        AssignCommand(oLaf, JumpToLocation(GetLocation(GetWaypointByTag("wp_cutatk_sabine2"))));
        AssignCommand(oArea, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE), oLaf));
    }
    if (GetIsDead(oParley) == FALSE)
    {
        AssignCommand(oParley, JumpToLocation(GetLocation(GetWaypointByTag("wp_cutatk_tan2"))));
        AssignCommand(oArea, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE), oParley));
    }
    if (GetIsDead(oGlim) == FALSE)
    {
        AssignCommand(oGlim, JumpToLocation(GetLocation(GetWaypointByTag("wp_cutatk_glim2"))));
        AssignCommand(oArea, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE), oGlim));
    }


    //Move attackers to positions

    AssignCommand(oDwarWar1, ClearAllActions());
    AssignCommand(oDwarWar1, JumpToLocation(lDrowAttack1));
    AssignCommand(oDwarWar2, ClearAllActions());
    AssignCommand(oDwarWar2, JumpToLocation(lDrowAttack2));
    AssignCommand(oDwarCleric1, ClearAllActions());
    AssignCommand(oDwarCleric1, JumpToLocation(lDrowAttack3));
    //AssignCommand(oDwarCleric2, ClearAllActions());
    //AssignCommand(oDwarCleric2, JumpToLocation(lDrowAttack4));
    AssignCommand(oDwarWiz1, ClearAllActions());
    AssignCommand(oDwarWiz1, JumpToLocation(lDrowAttack5));
    //AssignCommand(oDwarWiz2, ClearAllActions());
    //AssignCommand(oDwarWiz2, JumpToLocation(lDrowAttack6));

    AssignCommand(GetObjectByTag("cut5_drow1"), ClearAllActions());
    AssignCommand(GetObjectByTag("cut5_drow2"), ClearAllActions());
    AssignCommand(GetObjectByTag("cut5_drowwiz1"), ClearAllActions());
    AssignCommand(GetObjectByTag("cut5_drow1"), JumpToLocation(GetLocation(GetWaypointByTag("wp_cut5_drow1_1"))));
    AssignCommand(GetObjectByTag("cut5_drow2"), JumpToLocation(GetLocation(GetWaypointByTag("wp_cut5_drow2_1"))));
    AssignCommand(GetObjectByTag("cut5_drowwiz1"), JumpToLocation(GetLocation(GetWaypointByTag("wp_cut5_drowwiz_1"))));


    //Cast Darkness
    //CutActionCastSpellAtObject(20.0, SPELL_DARKNESS, GetObjectByTag("cut5_drowwiz1"), oDurnan, METAMAGIC_ANY, TRUE);
    //CutApplyEffectToObject2(23.0, DURATION_TYPE_TEMPORARY, EffectDarkness(), oDurnan, 12.0, FALSE);

    //Adjust factions so the bad guys hate the good guys
    ChangeToStandardFaction(GetObjectByTag("cut5_drowwiz1"),STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(GetObjectByTag("cut5_drow1"), STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(GetObjectByTag("cut5_drow2"), STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oDwarWiz1,STANDARD_FACTION_HOSTILE);
    //ChangeToStandardFaction(oDwarWiz2, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oDwarCleric1, STANDARD_FACTION_HOSTILE);
    //ChangeToStandardFaction(oDwarCleric2,STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oDwarWar1, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oDwarWar2, STANDARD_FACTION_HOSTILE);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_DARKNESS), oDurnan, 12.0);

    //***KLUDGE TO FIX FACTION PROBLEM***
    ClearPersonalReputation(oDurnan, oDaelan);
    ClearPersonalReputation(oDurnan, oSharwyn);
    ClearPersonalReputation(oDurnan, oTomi);
    ClearPersonalReputation(oDurnan, oLinu);

    ClearPersonalReputation(oTamsil, oDaelan);
    ClearPersonalReputation(oTamsil, oSharwyn);
    ClearPersonalReputation(oTamsil, oTomi);
    ClearPersonalReputation(oTamsil, oLinu);

    SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, 100, oDurnan);
    SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, 100, oTamsil);


    //Have henchmen equip weapons since they don't seem to want to do it on their own.
    AssignCommand(oDaelan, ActionEquipItem(GetItemPossessedBy(oDaelan, "NW_WDBMAX011"), INVENTORY_SLOT_RIGHTHAND));
    AssignCommand(oSharwyn, ActionEquipItem(GetItemPossessedBy(oSharwyn, "NW_WDBMSW011"), INVENTORY_SLOT_RIGHTHAND));

    FadeFromBlack(oPC, FADE_SPEED_FASTEST);

}
