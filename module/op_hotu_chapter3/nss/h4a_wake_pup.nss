//::///////////////////////////////////////////////
//:: Name h4a_wake_pup
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will wake the nearby sleeping pup.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 12, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();

    if(GetIsPC(oPC))
    {
        if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
            AssignCommand(GetNearestObjectByTag("hx_winter_wolf_s"), PlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0, 1.0));
            //DelayCommand(1.0, AssignCommand(GetNearestObjectByTag("hx_winter_wolf_p"), ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT)));
        }
    }
}
