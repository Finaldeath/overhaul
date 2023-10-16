//::///////////////////////////////////////////////
//:: Place the mirror in the standard bracket position
//:: cac_km_placemirr
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script places a mirror in a bracket
    according to the brackets position
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oBracket = OBJECT_SELF;
    object oInventory = GetItemPossessedBy(oPC, "pzl_mobilemirror");
    location lMirror = GetLocation(oBracket);

    AssignCommand(oPC, ActionMoveAwayFromLocation(lMirror, FALSE, 2.0f));

    object oMirror = CreateObject(OBJECT_TYPE_PLACEABLE, "km_finalmirror", lMirror, FALSE);
    string Dest2 = GetLocalString(oBracket, "DESTINATION2");

    SetLocalString(oBracket, "CURRENTDEST", Dest2);

    SetLocalInt(oBracket, "USABLE", FALSE);
    SetLocalInt(oBracket, "MIRROR", TRUE);
    SetLocalString(oMirror, "BRACKET_NAME", GetTag(oBracket));

    DestroyObject(oInventory);
    SetLocalInt(oMirror, "MIR_MOBILE", 1);
}
