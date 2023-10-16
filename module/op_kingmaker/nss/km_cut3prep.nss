//::///////////////////////////////////////////////
//:: km_cut3prep
//:: Copyright (c) 2004 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The first opening cutscene, PC and henchmen see the
    Masked Man for the first time seiging the Cyan keep.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: May 2004
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetFirstPC();

    FloatingTextStringOnCreature("The land of the dead fades around you.", oPC);
    FloatingTextStringOnCreature("You begin to feel more corporeal.", oPC);
    NightToDay(oPC, 3.0f);
    SetLocalInt(GetModule(), "KM_CUT3", 1);

    int iCounter = 0;
    object oGhost = GetObjectByTag("km_orcghost", iCounter++);
    while (oGhost != OBJECT_INVALID)
    {
        DestroyObject(oGhost);
        oGhost = GetObjectByTag("km_orcghost", iCounter++);
    }

    iCounter = 0;
    object oFire = GetObjectByTag("km_cut3prepfire", iCounter++);
    while (oFire != OBJECT_INVALID)
    {
        AssignCommand( oFire, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
        oFire = GetObjectByTag("km_cut3prepfire", iCounter++);
    }

}
