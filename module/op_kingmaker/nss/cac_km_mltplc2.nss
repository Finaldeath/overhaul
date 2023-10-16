//::///////////////////////////////////////////////
//:: Place the mirror in the bracket at position two
//:: cac_km_mltplc2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script places the mirror for bracket G
    in the the second position
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

    int iFacing2 = GetLocalInt(oBracket, "FACING2");
    string Dest3 = GetLocalString(oBracket, "DESTINATION3");

    AssignCommand(oBracket, SetFacing(IntToFloat(iFacing2)));

    location lMirror = GetLocation(oBracket);
    object oMirror = CreateObject(OBJECT_TYPE_PLACEABLE, "km_finalmirror", lMirror, FALSE);

    AssignCommand(oMirror, SetFacing(IntToFloat(iFacing2)));

    SetLocalString(oBracket, "CURRENTDEST", Dest3);
    SetLocalInt(oBracket, "MIRROR", 1);
    SetLocalInt(oBracket, "USABLE", FALSE);
    SetLocalString(oMirror, "BRACKET_NAME", GetTag(oBracket));
    DestroyObject(oInventory);
    SetLocalInt(oMirror, "MIR_MOBILE", 1);
}
