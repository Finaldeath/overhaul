//::///////////////////////////////////////////////
//:: Name bat2_emptycore
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Empty the city core area of all ambient NPCs
    in preparation for battle 2
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 3/03
//:://////////////////////////////////////////////

void main()
{
    //PrintString("DEBUG*** ENTERING CITY CORE _ BATTLE 2 - SETUP PHASE");
    //Get rid of all creatures in the city core...except the PC and those with masters (the PCs associates)
    object oCreature = GetFirstObjectInArea();
    string szTag;
    while (GetIsObjectValid(oCreature) == TRUE)
    {
        if (GetObjectType(oCreature) == OBJECT_TYPE_CREATURE)
        {
            if (GetIsPC(oCreature) == FALSE || GetIsObjectValid(GetMaster(oCreature)) == FALSE)
            {
                SetPlotFlag(oCreature, FALSE);
                DestroyObject(oCreature);
            }
        }
        oCreature = GetNextObjectInArea();
    }
}
