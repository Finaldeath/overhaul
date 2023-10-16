//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If this is the first time the client is entering this area - he's coming
    from Cutscene 1 - so spawn in the assassin in the First room.
*/
//:://////////////////////////////////////////////
//:: Created By:   Keith Warner
//:: Created On:   Oct 30/02
//:://////////////////////////////////////////////
// Updated July 2/03 - Several changes to script to accomodate low level
//   characters. Further comments in body of this script.
//UPDATED JAN 6/03 - Changed to - On entry of hero PC - strip of all equipment.
//  Place equipment in the chest at the foot of the PCs bed.  Create key for
//  chest on the PC and initiate dialog with prologue object

//UPDATED June 20/03 While removing all the item, total the value of their equipment.
//If they have less than 15000 gp in items, spawn a longsword +3
//(or quarterstaff +3 if wizard, monk, druid) and a ring of protection +3.

//UPDATE AUGUST 11/03 - Now the plan is to have the drow 'thief' steal the chest with
//the PCs stuff (which may turn up later on)..So store all the stuff in a box in the
//Random Treasure area.. Spawn in the assassin when the area is first entered..

//::///////////////////////////////////////////////
//:: ExcludeItem
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    A function just to return true if this
    item should not be allowed when the player first enters
    the game.
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: June 2003
//:://////////////////////////////////////////////

int ExcludeItem(object oGear)
{
  string sTag = GetTag(oGear);
  // * don't filter Tynan out. Is an easter egg in c2
  if (sTag == "PortableDoor" || sTag == "x0_spellstaff" || sTag == "x0_powerstone"
    ||sTag == "golemmakerkey" || sTag == "Library_Pen" || sTag == "Library_Inkwell"
    || sTag=="q1monkitem" || sTag == "q1sorcereritem" || sTag == "q1rangeritem"
    || sTag == "q1clericitem" || sTag == "q1rogueitem" || sTag == "q1barbitem"
    || sTag == "q1paladinitem" || sTag == "q1barditem" || sTag == "q1mageitem"
    || sTag == "q1fighteritem" || sTag == "q1druiditem"
    || sTag == "q1footstagtrophy" || sTag == "TempleRites" || sTag == "x1dragontooth"
    || sTag == "x1mask" || sTag == "xp1_pcjournal" || sTag == "ShadowGem"
    || sTag == "NW_MSMLMISC23" || sTag == "NW_MSMLMISC10" || sTag == "NW_MSMLMISC19"
    || sTag == "NW_MSMISC17" || sTag == "Q2_KEY_PUZZLE_ROOM" || sTag == "q3_promissary"
    || sTag == "Q2_PROTECTIVE_HELMET"
    )
  {
    return TRUE;
  }
  return FALSE;

}
void DeMagnitizePC(object oPC)
{
    effect eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        RemoveEffect(oPC, eEffect);
        eEffect = GetNextEffect(oPC);
    }
}
void main()
{

    //Level character up to 15, if character is below level 15
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;


    // * Oct 1
    // * Brent
    // *
    // * If started with a low level character, saved, then
    // * reloaded, restart the "level me up" dialog
    // *
    // * LOGIC: If in the start "second floor room"
    // * and still I am not level 15, then try starting the conversation again
    string sArea = GetTag(GetArea(oPC));
    int nHitDie = GetHitDice(oPC);
//    SendMessageToPC(oPC, sArea);
//    SendMessageToPC(oPC, IntToString(nHitDie));
    if (sArea == "q2a_yprooms" && nHitDie <12)
    {
        //variable for rest message for the room door
        SetLocalInt(oPC, "X2_Q2ARestMessage", 1);

        AssignCommand(oPC, ClearAllActions());
        DelayCommand(2.0, AssignCommand(oPC, ActionStartConversation(OBJECT_SELF, "bk_levelup", FALSE, FALSE)));
        return;
    }


// *************************
// * If less than level 12
// * then entering this area
// * as a newbie. Should not
// * get the assassin until the
// * next day
// * BRENT
// *************************

    /* BRENT MODIFICATION

    For low level characters this conversation will not play the first time

    */
    if (GetHitDice(oPC) < 12)
    {
        return; // * This will be ran when they return from the other cutscene
    }

    //Check to make sure enterer is a PC and assassin has never spawned (and that the PC has been to the cutscene and hasn't just saved and loaded in the rooms)
    if (GetIsPC(oPC) && (GetLocalInt(GetModule(), "nAssassin") != 1 || GetLocalInt(GetModule(), "INIT_IMMOBILIZE_REMOVED") == 0)
                     && GetLocalInt(oPC, "X2_Q2ASpawnTheAssassin") == 1)
    {
        if(GetLocalInt(GetModule(), "INIT_IMMOBILIZE_REMOVED") == 0 && GetLocalInt(GetModule(), "nAssassin") == 1)
        {
            object oDialog = GetObjectByTag("q2aprologue");
            DelayCommand(1.5, AssignCommand(oDialog, ActionStartConversation(oPC, "pre_awake1")));
            return;

        }
        //variable for rest message for the room door
        SetLocalInt(oPC, "X2_Q2ARestMessage", 0);

        BlackScreen(oPC);
        DeMagnitizePC(oPC);
        // * September 2003: Disable relic of reaper from working
        // * until this variable is turned off (after the rogue is dead)
        SetLocalInt(GetModule(), "x2_g_disabled", 10);

        AddJournalQuestEntry("portalstone", 20, oPC, FALSE);

        object oContainer = GetObjectByTag("x2_chapter1pcequip"); //NEW CONTAINER -
        // This container is in the final area of Chapter 1!

        // * pick up any equipment lying on the ground
        // * Thanks Mr. Cheater!
        object oArea = OBJECT_INVALID;
        object oItem = GetFirstObjectInArea(oArea);
        while (GetIsObjectValid(oItem) == TRUE)
        {
            if (GetObjectType(oItem) == OBJECT_TYPE_ITEM)
            {
                CopyItem(oItem, oContainer);
                SetPlotFlag(oItem, FALSE);
                DestroyObject(oItem, 0.1);
            }
            oItem = GetNextObjectInArea(oArea);
        }

        //if this is the main PC - who has had the dream
        if (GetLocalInt(oPC, "nPCNumber") == 1)
        {

            //if this is the case, strip PC of all equipment, place
            //it on the weapons rack ("q2a_pc_equip" and
            //spawn in the assassin ("q2adrowassassin")
            // Removing PC's equipment.
            object oGear = GetItemInSlot(INVENTORY_SLOT_ARMS, oPC);
            object oGear2;
            //object oContainer = GetObjectByTag("q2a_pc_equip");//OLD CONTAINER - IN PC START ROOM
            int nGold = 0;

            if(GetIsObjectValid(oGear))
            {
                nGold = nGold + GetGoldPieceValue(oGear);
                oGear2 = CopyItem(oGear, oContainer);
                SetPlotFlag(oGear, FALSE);
                DestroyObject(oGear);
            }
            oGear = GetItemInSlot(INVENTORY_SLOT_BELT, oPC);
            if(GetIsObjectValid(oGear))
            {
                nGold = nGold + GetGoldPieceValue(oGear);
                oGear2 = CopyItem(oGear, oContainer);
                SetPlotFlag(oGear, FALSE);
                DestroyObject(oGear);
            }
            oGear = GetItemInSlot(INVENTORY_SLOT_BOLTS, oPC);
            if(GetIsObjectValid(oGear))
            {
                nGold = nGold + GetGoldPieceValue(oGear);
                oGear2 = CopyItem(oGear, oContainer);
                SetPlotFlag(oGear, FALSE);
                DestroyObject(oGear);
            }
            oGear = GetItemInSlot(INVENTORY_SLOT_BOOTS, oPC);
            if(GetIsObjectValid(oGear))
            {
                nGold = nGold + GetGoldPieceValue(oGear);
                oGear2 = CopyItem(oGear, oContainer);
                SetPlotFlag(oGear, FALSE);
                DestroyObject(oGear);
            }
            oGear = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);
            if(GetIsObjectValid(oGear))
            {
                nGold = nGold + GetGoldPieceValue(oGear);
                oGear2 = CopyItem(oGear, oContainer);
                SetPlotFlag(oGear, FALSE);
                DestroyObject(oGear);
            }

            oGear = GetItemInSlot(INVENTORY_SLOT_CLOAK, oPC);
            if(GetIsObjectValid(oGear))
            {
                nGold = nGold + GetGoldPieceValue(oGear);
                oGear2 = CopyItem(oGear, oContainer);
                SetPlotFlag(oGear, FALSE);
                DestroyObject(oGear);
            }
            oGear = GetItemInSlot(INVENTORY_SLOT_HEAD, oPC);
            if(GetIsObjectValid(oGear))
            {
                nGold = nGold + GetGoldPieceValue(oGear);
                oGear2 = CopyItem(oGear, oContainer);
                SetPlotFlag(oGear, FALSE);
                DestroyObject(oGear);
            }
            oGear = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
            if(GetIsObjectValid(oGear))
            {
                nGold = nGold + GetGoldPieceValue(oGear);
                oGear2 = CopyItem(oGear, oContainer);
                SetPlotFlag(oGear, FALSE);
                DestroyObject(oGear);
            }
            oGear = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPC);
            if(GetIsObjectValid(oGear))
            {
                nGold = nGold + GetGoldPieceValue(oGear);
                oGear2 = CopyItem(oGear, oContainer);
                SetPlotFlag(oGear, FALSE);
                DestroyObject(oGear);
            }
            oGear = GetItemInSlot(INVENTORY_SLOT_NECK, oPC);
            if(GetIsObjectValid(oGear))
            {
                nGold = nGold + GetGoldPieceValue(oGear);
                oGear2 = CopyItem(oGear, oContainer);
                SetPlotFlag(oGear, FALSE);
                DestroyObject(oGear);
            }
            oGear = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
            if(GetIsObjectValid(oGear))
            {
                nGold = nGold + GetGoldPieceValue(oGear);
                oGear2 = CopyItem(oGear, oContainer);
                SetPlotFlag(oGear, FALSE);
                DestroyObject(oGear);
            }

            oGear = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPC);
            if(GetIsObjectValid(oGear))
            {
                nGold = nGold + GetGoldPieceValue(oGear);
                oGear2 = CopyItem(oGear, oContainer);
                SetPlotFlag(oGear, FALSE);
                DestroyObject(oGear);
            }
            oGear = GetItemInSlot(INVENTORY_SLOT_ARROWS, oPC);
            if(GetIsObjectValid(oGear))
            {
                nGold = nGold + GetGoldPieceValue(oGear);
                oGear2 = CopyItem(oGear, oContainer);
                SetPlotFlag(oGear, FALSE);
                DestroyObject(oGear);
            }
            oGear = GetItemInSlot(INVENTORY_SLOT_BOLTS, oPC);
            if(GetIsObjectValid(oGear))
            {
                nGold = nGold + GetGoldPieceValue(oGear);
                oGear2 = CopyItem(oGear, oContainer);
                SetPlotFlag(oGear, FALSE);
                DestroyObject(oGear);
            }
            oGear = GetItemInSlot(INVENTORY_SLOT_BULLETS, oPC);
            if(GetIsObjectValid(oGear))
            {
                nGold = nGold + GetGoldPieceValue(oGear);
                oGear2 = CopyItem(oGear, oContainer);
                SetPlotFlag(oGear, FALSE);
                DestroyObject(oGear);
            }

            //Empty all items from the PCs inventory
            //Destroy any XP1 specific items
            //UPDATE 08/11/03 - Keep XP1 items for now
            oGear = GetFirstItemInInventory(oPC);
            while (oGear != OBJECT_INVALID)
            {
                //Don't destroy the reaper stone, rogue stone or Deekin's book
                //if (GetTag(oGear) != "x2_p_reaper" && GetTag(oGear) != "x2_p_rogue" && GetTag(oGear) != "bookoflegends")
                //{
                    nGold = nGold + GetGoldPieceValue(oGear);
                    oGear2 = CopyItem(oGear, oContainer);
                    SetPlotFlag(oGear, FALSE);
                    DestroyObject(oGear);

                oGear = GetNextItemInInventory(oPC);
            }

            //Get Rid of Gold
            TakeGoldFromCreature(GetGold(oPC), oPC, TRUE);
   // ******************************
   // * EXTRA ITEM SPAWNING
   // ******************************


//If they have less than 15000 gp in items, spawn a longsword +3
//(or quarterstaff +3 if wizard, monk, druid) and a ring of protection +3.
            if (nGold < 15000)
            {
                if (GetLevelByClass(CLASS_TYPE_WIZARD, oPC) > 5 ||
                    GetLevelByClass(CLASS_TYPE_MONK, oPC) > 5 ||
                    GetLevelByClass(CLASS_TYPE_DRUID, oPC) > 5)
                {
                    //create quarterstaff
                    CreateItemOnObject("nw_wdbmqs009", oContainer);
                }
                else
                {
                    //create longsword
                    CreateItemOnObject("nw_wswmls012", oContainer);
                }
                    //Create ring of protection
                CreateItemOnObject("nw_it_mring018", oContainer);
            }

            object oDialog = GetObjectByTag("q2aprologue");
            DelayCommand(1.5, AssignCommand(oDialog, ActionStartConversation(oPC, "pre_awake1")));


            // * July 2 2003: Spawn in reaper stone - BK
            //if (GetIsObjectValid(GetItemPossessedBy(oPC, "x2_p_reaper")) == FALSE)
            //{
            object oStone = CreateItemOnObject("x2_p_reaper", oPC);
            SetItemCursedFlag(oStone, TRUE);
            // * create one rogue stone
            CreateItemOnObject("x2_p_rogue", oPC, 1);

            //}


            // * Spawn Deekin's book on the player
                CreateItemOnObject("bookoflegends", oPC);
        }
        else
        {

            //destroy any portal stones held by other players
            if (GetIsObjectValid(GetItemPossessedBy(oPC, "x2_p_reaper")) == TRUE)
            {
                object oStone = GetItemPossessedBy(oPC, "x2_p_reaper");
                DestroyObject(oStone);
            }
        }

        //Do the following only the first time the area is entered
        if (GetLocalInt(OBJECT_SELF, "nSaved") == 1)
             return;

        SetLocalInt(OBJECT_SELF, "nSaved", 1);
        DoSinglePlayerAutoSave();

        object oKiller = CreateObject(OBJECT_TYPE_CREATURE, "q2adrowassassin", GetLocation(GetWaypointByTag("wp_q2a_assassin")));

        object oChest = GetObjectByTag("q2a_pc_equip");
        AssignCommand(oKiller, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 60.0));
        SetLocalInt(GetModule(), "nAssassin", 1);


        // * Spawn and add the new complementary dagger
        object oDagger = CreateItemOnObject("x2_newdag", oPC);
        AssignCommand(oPC, ActionEquipItem(oDagger, INVENTORY_SLOT_RIGHTHAND));

        // Added by: Brad Prince. This was done to cover the naked PC bumping that
        // happened before drow assassin. Looked unpolished.

        DelayCommand(1.0, FadeFromBlack(oPC, FADE_SPEED_MEDIUM));
    }


}
