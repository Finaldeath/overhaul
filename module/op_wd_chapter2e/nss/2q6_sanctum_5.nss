//::///////////////////////////////////////////////
//:: Golem Attack the Door
//:: 2q6)Sanctum_5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the special helmed horror attacks the door
    then destroy it.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 22, 2002
//:://////////////////////////////////////////////

void main()
{
    object oTarget = GetLastAttacker();

    if(GetIsObjectValid(oTarget))
    {
        if(GetTag(oTarget) == "2Q6_HelmHorror")
        {
            DestroyObject(OBJECT_SELF, 6.0);
        }
    }
}
