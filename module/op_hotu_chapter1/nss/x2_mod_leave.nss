//::///////////////////////////////////////////////
//:: Name x2_mod_leave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On Client Leave - check to see if the PC who
    possessed the Relic of the Reaper (the Hero PC)
    was the one who left - if it was - create a new
    Hero PC - with a new Relic
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 17/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    int nHeroCount = 0;
    while (oPC != OBJECT_INVALID)
    {
        if (GetIsObjectValid(GetItemPossessedBy(oPC,"x2_p_reaper")) == TRUE)
        {
            //if it was not the Hero PC exiting then we are ok
            if (GetName(oPC) != GetName(GetExitingObject()))
            {
                nHeroCount = 1;
            }

        }
        oPC = GetNextPC();
    }
    //if we couldn't find a hero - make a new one
    if (nHeroCount == 0)
    {

        object oNewHero = GetFirstPC();
        if (GetName(oNewHero) == GetName(GetExitingObject()))
            oNewHero = GetNextPC();
        CreateItemOnObject("x2_p_portal", oNewHero);
        SetLocalInt(oNewHero, "nPCNumber", 1);
    }

}
