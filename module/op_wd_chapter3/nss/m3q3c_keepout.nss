//::///////////////////////////////////////////////
//:: M3Q3C_KEEPOUT
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Clears the creatures' actions if they try to follow you through the transition.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 3, 2002
//:://////////////////////////////////////////////

void main()
{
    string sDwarf = "M3Q3C02_DWARF_1";
    string sHodd = "M3Q3C07_HODD";
    string sDryad = "M3Q3C02_DRYAD_1";
    string sArwyl = "M3Q3C04_ARWYL";
    object oEntering=GetEnteringObject();
    string sEntering = GetTag(oEntering);
    if (sEntering == sDwarf || sEntering == sHodd || sEntering == sArwyl || sEntering == sDryad)
    {
        AssignCommand(oEntering,ClearAllActions());
    }

}
