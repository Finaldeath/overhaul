//::///////////////////////////////////////////////
//:: Name q2a_exit_area
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PC is exiting after winning or losing
    battle 1 - Clean up all objects in the area...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 2/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetExitingObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    //if the battle has not been lost or won - do nothing
    if (GetLocalInt(GetModule(), "X2_Q2ABattle1Lost") == 1 || GetLocalInt(GetModule(), "X2_Q2ABattle1Won") == 1)
    {
       //SendMessageToPC(GetFirstPC(), "Destroying all creatures");
        //Clean up all creatures in the area...

        object oArea = GetObjectByTag("q2a_city1");

        object oCreature = GetFirstObjectInArea(oArea);
        while (oCreature != OBJECT_INVALID)
        {
            if (GetObjectType(oCreature) == OBJECT_TYPE_CREATURE)
            {
                if (GetIsObjectValid(GetMaster(oCreature)) == FALSE)
                {
                    DestroyObject(oCreature);
                }
            }
            oCreature = GetNextObjectInArea(oArea);
        }
    }
}
