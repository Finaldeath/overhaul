//::///////////////////////////////////////////////
//:: M3Q3END.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When the Dragon dies, it destroys all the
    Dryads and Dwarves, then leave a Shrine in the central
    area saying "Thank You"
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    // * Dragon sets plot as being over now
    object oDoor = GetNearestObjectByTag("M3Q3CA_M3Q3C");
    AssignCommand(oDoor,ActionCloseDoor(oDoor));
    SetLocked(oDoor,TRUE);

    SetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL",99);

    SetIsDestroyable(FALSE, FALSE, FALSE);
    // * unlock chest
    SetLocked(GetObjectByTag("M3Q3C10Chest"), FALSE);

    // * destroy all Dryads and Dwarfs in the Game
    object oArea = GetArea(GetObjectByTag("M3Q3C04_ARWYL"));
    object oCreature =   GetObjectByTag("M3Q3C04_ARWYL");
    DestroyObject(oCreature);
    oCreature = GetObjectByTag("M3Q3C07_HODD");
    DestroyObject(oCreature);
    oCreature = GetFirstObjectInArea(oArea);
    while (GetIsObjectValid(oCreature) == TRUE)
    {
        if ( (GetTag(oCreature) == "M3Q3C02_DWARF_1") || (GetTag(oCreature) == "M3Q3C02_DRYAD_1"))
        {
            DestroyObject(oCreature);
        }
        oCreature = GetNextObjectInArea(oArea);
    }

}
