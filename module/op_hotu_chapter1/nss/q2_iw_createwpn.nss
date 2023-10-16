// the longsword on the skeleton disappears
// all the skeletons in the Hall attack

#include "x2_inc_intweapon"
#include "nw_i0_generic"
void AwakenKings(object oPC);
void main()
{
    // first the longsword object has to disappear (the player has grabbed it)
    // perhaps have the PC walk up to it, as well?
    object oKing = GetObjectByTag("q2bsk_2");
    object oSword = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oKing);
    DestroyObject(oSword);

    object oItem;
    object oPC = GetPCSpeaker();
    int nWeapon = GetLocalInt(GetModule(), "IW_WPNCHG");

    if (nWeapon < 2)
    {
        oItem = CreateItemOnObject("iw_longsword", oPC);
    }
    else if (nWeapon == 2)
    {
        oItem = CreateItemOnObject("iw_dagger", oPC);
    }
    else if (nWeapon == 3)
    {
        oItem = CreateItemOnObject("iw_shortsword", oPC);
    }
    else if (nWeapon == 4)
    {
        oItem = CreateItemOnObject("iw_greatsword", oPC);
    }


    IWCreateIntelligentWeapon(oItem);

    // at this point all the skeletons have to become hostile and attack
    AwakenKings(oPC);

}
void AwakenKings(object oPC)
{
    SetLocalInt(GetModule(), "X2_Q2BSkelKingsHostile", 1);
        object oKing1 = GetObjectByTag("q2bsk_1");
        object oKing2 = GetObjectByTag("q2bsk_2");
        object oKing3 = GetObjectByTag("q2bsk_3");
        object oKing5 = GetObjectByTag("q2bsk_5");
        object oKing6 = GetObjectByTag("q2bsk_6");
        object oKing7 = GetObjectByTag("q2bsk_7");
        object oKing9 = GetObjectByTag("q2bsk_9");

        if (oPC == OBJECT_INVALID)
            oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

        if (GetIsObjectValid(oKing1) == TRUE)
        {
            SetPlotFlag(oKing1, FALSE);
            ChangeToStandardFaction(oKing1, STANDARD_FACTION_HOSTILE);
            AssignCommand(oKing1, ActionMoveToObject(oPC));
            AssignCommand(oKing1, DetermineCombatRound());
        }
        if (GetIsObjectValid(oKing2) == TRUE)
        {
            SetPlotFlag(oKing2, FALSE);
            ChangeToStandardFaction(oKing2, STANDARD_FACTION_HOSTILE);
            AssignCommand(oKing2, ActionMoveToObject(oPC));
            AssignCommand(oKing2, DetermineCombatRound());
        }
        if (GetIsObjectValid(oKing3) == TRUE)
        {
            SetPlotFlag(oKing3, FALSE);
            ChangeToStandardFaction(oKing3, STANDARD_FACTION_HOSTILE);
            AssignCommand(oKing3, ActionMoveToObject(oPC));
            AssignCommand(oKing3, DetermineCombatRound());
        }
        if (GetIsObjectValid(oKing5) == TRUE)
        {
            SetPlotFlag(oKing5, FALSE);
            ChangeToStandardFaction(oKing5, STANDARD_FACTION_HOSTILE);
            AssignCommand(oKing5, ActionMoveToObject(oPC));
            AssignCommand(oKing5, DetermineCombatRound());
        }
        if (GetIsObjectValid(oKing6) == TRUE)
        {
            SetPlotFlag(oKing6, FALSE);
            ChangeToStandardFaction(oKing6, STANDARD_FACTION_HOSTILE);
            AssignCommand(oKing6, ActionMoveToObject(oPC));
            AssignCommand(oKing6, DetermineCombatRound());
        }
        if (GetIsObjectValid(oKing7) == TRUE)
        {
            SetPlotFlag(oKing7, FALSE);
            ChangeToStandardFaction(oKing7, STANDARD_FACTION_HOSTILE);
            AssignCommand(oKing7, ActionMoveToObject(oPC));
            AssignCommand(oKing7, DetermineCombatRound());
        }
        if (GetIsObjectValid(oKing9) == TRUE)
        {
            SetPlotFlag(oKing9, FALSE);
            ChangeToStandardFaction(oKing9, STANDARD_FACTION_HOSTILE);
            AssignCommand(oKing9, ActionMoveToObject(oPC));
            AssignCommand(oKing9, DetermineCombatRound());
        }

        //Close and lock the room doors
        object oDoor1 = GetObjectByTag("q2bskdoor1");
        object oDoor2 = GetObjectByTag("q2bskdoor2");
        AssignCommand(oDoor1, ActionCloseDoor(oDoor1));
        AssignCommand(oDoor2, ActionCloseDoor(oDoor2));
        SetLocked(oDoor1, TRUE);
        SetLocked(oDoor2, TRUE);
        PlaySound("as_cv_brickscrp2");
}
