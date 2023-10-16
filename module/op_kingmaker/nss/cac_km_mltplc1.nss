//::///////////////////////////////////////////////
//:: Place the mirror in the bracket at position one
//:: cac_km_mltplc1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script places the mirror for bracket G
    in the the first position
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

    int iFacing1 = GetLocalInt(oBracket, "FACING1");
    string Dest2 = GetLocalString(oBracket, "DESTINATION2");

    AssignCommand(oBracket, SetFacing(IntToFloat(iFacing1)));

    location lMirror = GetLocation(oBracket);
    object oMirror = CreateObject(OBJECT_TYPE_PLACEABLE, "km_finalmirror", lMirror, FALSE);

    AssignCommand(oMirror, SetFacing(IntToFloat(iFacing1)));

    SetLocalString(oBracket, "CURRENTDEST", Dest2);
    SetLocalInt(oBracket, "MIRROR", TRUE);
    SetLocalInt(oBracket, "USABLE", FALSE);
    SetLocalString(oMirror, "BRACKET_NAME", GetTag(oBracket));
    DestroyObject(oInventory);
    SetLocalInt(oMirror, "MIR_MOBILE", 1);
}
