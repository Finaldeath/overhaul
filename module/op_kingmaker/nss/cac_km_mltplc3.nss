//::///////////////////////////////////////////////
//:: Place the mirror in the bracket at position two
//:: cac_km_mltplc3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script places the mirror for bracket G
    in the the third position
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

    int iFacing3 = GetLocalInt(oBracket, "FACING3");
    string Dest4 = GetLocalString(oBracket, "DESTINATION4");

    AssignCommand(oBracket, SetFacing(IntToFloat(iFacing3)));

    location lMirror = GetLocation(oBracket);
    object oMirror = CreateObject(OBJECT_TYPE_PLACEABLE, "km_finalmirror", lMirror, FALSE);

    AssignCommand(oMirror, SetFacing(IntToFloat(iFacing3)));

    SetLocalString(oBracket, "CURRENTDEST", Dest4);
    SetLocalInt(oBracket, "MIRROR", 1);
    SetLocalInt(oBracket, "USABLE", FALSE);
    SetLocalString(oMirror, "BRACKET_NAME", GetTag(oBracket));
    DestroyObject(oInventory);
    SetLocalInt(oMirror, "MIR_MOBILE", 1);
}
