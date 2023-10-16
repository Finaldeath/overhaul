//::///////////////////////////////////////////////
//:: Witchwork 1: Starting Area OnEnter
//:: WW1_Start_OnEnt.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Character setup and initial cutscene.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 25, 2002
//:://////////////////////////////////////////////

void DMInform(object oEnterer)
{
    //Only track player movement.
    if (GetIsPC(oEnterer) == TRUE)
    {
        string sCharName = GetName(oEnterer);
        string sPlayerName = GetPCPlayerName(oEnterer);
        string sAreaName = GetName(OBJECT_SELF);
        string sAreaTag = GetTag(OBJECT_SELF);

        //Build and send message...
        SendMessageToAllDMs(sCharName+" ("+sPlayerName+") has entered "+
                            sAreaName+" ("+sAreaTag+").");
    }
}

void Setup(object oEnterer)
{
    //Set the player's death local to -1 to accommodate deaths taking
    //place prior to the Night Hag's tour of the Plane of Sorrows.
    SetLocalInt(oEnterer, "iDeaths", -1);

    //Set their XP to 0 to make sure everyone's at 1st level.
    SetXP(oEnterer, 0);

    //Injure the player
    int iCurrentHP = GetCurrentHitPoints(oEnterer);
    effect eDamage = EffectDamage(iCurrentHP - 1);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oEnterer);

    //Strip their items
    int iGold = GetGold(oEnterer);
    AssignCommand(oEnterer, TakeGoldFromCreature(iGold, oEnterer, TRUE));
    object oItem = GetItemInSlot(INVENTORY_SLOT_ARMS, oEnterer);
    DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_ARROWS, oEnterer);
    DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_BELT, oEnterer);
    DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_BOLTS, oEnterer);
    DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_BOOTS, oEnterer);
    DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_BULLETS, oEnterer);
    DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_CARMOUR, oEnterer);
    DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oEnterer);
    DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_CLOAK, oEnterer);
    DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B, oEnterer);
    DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, oEnterer);
    DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R, oEnterer);
    DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_HEAD, oEnterer);
    DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oEnterer);
    DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oEnterer);
    DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_NECK, oEnterer);
    DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oEnterer);
    DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oEnterer);
    DestroyObject(oItem);
    oItem = GetFirstItemInInventory(oEnterer);
    while (oItem != OBJECT_INVALID)
    {
        DestroyObject(oItem);
        oItem = GetNextItemInInventory(oEnterer);
    }

    //Add the new items
      //Tattered Armor
    object oArmor = CreateItemOnObject("tatteredkingsarm", oEnterer);
    DelayCommand(0.1, AssignCommand(oEnterer, ActionEquipItem(oArmor, INVENTORY_SLOT_CHEST)));

      //Alignment-Based Ring
    int iAlignment = GetAlignmentLawChaos(oEnterer);
    int iRandom = Random(100)+1;
    if (iAlignment = ALIGNMENT_CHAOTIC ||
        (iAlignment = ALIGNMENT_NEUTRAL &&
         iRandom > 50))
    {
        //Iron Ring (special use)
        object oIronRing = CreateItemOnObject("ww1_ironring", oEnterer);
        DelayCommand(0.1, AssignCommand(oEnterer, ActionEquipItem(oIronRing, INVENTORY_SLOT_RIGHTRING)));
    }
    else
    {
        //Gold Ring (no special use)
        object oGoldRing = CreateItemOnObject("ww1_goldring", oEnterer);
        DelayCommand(0.1, AssignCommand(oEnterer, ActionEquipItem(oGoldRing, INVENTORY_SLOT_RIGHTRING)));
    }

      //Tracking Tool for Rangers
    int iRanger = GetLevelByClass(CLASS_TYPE_RANGER, oEnterer);
    if (iRanger != 0)
    {
        CreateItemOnObject("trackertool", oEnterer);
    }

      //Paladin Items

    //Increment the number of players.
    int iNumPlayers = GetLocalInt(GetModule(),"ww1_iNumPlayers");
    iNumPlayers++;
    SetLocalInt(GetModule(),"ww1_iNumPlayers", iNumPlayers);

    //If they aren't the first player through, return 75 gp to cover the fact
    //that previous players might have looted all the bodies.
    if (iNumPlayers > 1)
    {
        GiveGoldToCreature(oEnterer, 75);
    }
}

void StripClone(object oClone)
{
    //Destroy visible objects
    object oHelm = GetItemInSlot(INVENTORY_SLOT_HEAD, oClone);
    object oLeft = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oClone);
    object oRight = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oClone);
    object oArmor = GetItemInSlot(INVENTORY_SLOT_CHEST, oClone);
    DestroyObject(oHelm);
    DestroyObject(oLeft);
    DestroyObject(oRight);
    DestroyObject(oArmor);
}

void EquipClone(object oClone)
{
    //Equip King's Armor
    object oKingsArmor = CreateItemOnObject("tatteredkingsarm", oClone);
    DelayCommand(0.1, AssignCommand(oClone, ActionEquipItem(oKingsArmor, INVENTORY_SLOT_CHEST)));
}

void StartConversation(object oEnterer, object oAhmedInvis)
{
    AssignCommand(oAhmedInvis, ActionStartConversation(oEnterer,"",TRUE, FALSE));
}

void Entry (object oEnterer)
{
    FadeFromBlack(oEnterer, FADE_SPEED_SLOWEST);
    AssignCommand(oEnterer, SetCameraFacing(180.0, 6.0, 62.0, 10));
}

void main()
{
    //Handle DM stuff here.
    object oEnterer = GetEnteringObject();
    if (GetIsDM(oEnterer) == TRUE)
    {
        //Give DMs a Witch Wake Plot Handler item if they don't already have one.
        object oWitchWakeHandler = GetItemPossessedBy(oEnterer, "ww_plothandler");
        if (GetIsObjectValid(oWitchWakeHandler) == FALSE)
        {
            CreateItemOnObject("ww_plothandler", oEnterer);
        }
    }
    //Only Players see the cutscene, not DMs.
    else if (GetIsPC(oEnterer) == TRUE)
    {
        //Inform DM of player movement
        DMInform(oEnterer);

        //Put them into cutscene mode
        SetCutsceneMode(oEnterer, TRUE);

        //Run the setup routine.
        DelayCommand(1.0, Setup(oEnterer));

        //Jump them to the starting waypoint (in case the true startpoint moves)
        object oStart = GetObjectByTag("WP_Start");
        DelayCommand(1.5, AssignCommand(oEnterer, JumpToObject(oStart)));

        //Set the local that causes the soldiers to start fighting.
        SetLocalInt(OBJECT_SELF, "bCinematicOn", TRUE);

        //Apply the ghost effect to remove their walkmesh.
        effect eCutGhost = EffectCutsceneGhost();
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eCutGhost, oEnterer, 30.0);

        //Spawn in a clone.
        location lLoc = GetLocation(oStart);
        object oClone = CopyObject(oEnterer, lLoc);
        AssignCommand(oClone,ChangeToStandardFaction(oClone,STANDARD_FACTION_COMMONER));
        SetLocalObject(oEnterer, "oCut1_Clone", oClone);

        //Ensure the clone has the right equipment.
        DelayCommand(1.0, StripClone(oClone));
        DelayCommand(2.0, EquipClone(oClone));

        //Make the clone lie down.
        DelayCommand(3.5, AssignCommand(oClone, PlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 1.0, 5.0)));
        effect eFreeze = EffectCutsceneParalyze();
        DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eFreeze, oClone));

        //Flag the clone as plot.
        DelayCommand(4.5, SetPlotFlag(oClone, TRUE));

        //Make the original player invisible.
        effect eCutInvis = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eCutInvis, oEnterer);

        //Do a slow fade from black
        BlackScreen(oEnterer);

        //Establish the camera shot.
        DelayCommand(4.9, AssignCommand(oEnterer, SetCameraFacing(300.0, 6.0, 62.0)));
        DelayCommand(5.0, Entry(oEnterer));
        DelayCommand(17.0, AssignCommand(oEnterer, SetCameraFacing(60.0, 6.0, 62.0, 10)));

        //Create an invisible object containing Prince Ahmed's conversation. A new
        //one will be created for each player, making it multiplayer-friendly.
        object oAhmedVis = GetNearestObjectByTag("PrinceAhmedVis", oEnterer);
        location lAhmedVis = GetLocation(oAhmedVis);
        object oAhmedInvis = CreateObject(OBJECT_TYPE_PLACEABLE, "princeahmedinvis", lAhmedVis);
        SetLocalObject(oEnterer, "oAhmedConversation", oAhmedInvis);

        //Launch Prince Ahmed's conversation once the camera movement is done.
        //DelayCommand(29.0, StartConversation(oEnterer, oAhmedInvis));
        DelayCommand(31.0, StartConversation(oEnterer, oAhmedInvis));

/*DEBUG*///DelayCommand(30.0, SetCutsceneMode(oEnterer, FALSE));
/*DEBUG*///DelayCommand(30.0, DestroyObject(oClone));
    }

}
