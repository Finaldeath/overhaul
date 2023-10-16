//::///////////////////////////////////////////////
//:: Cows Exit
//:: q3_trg_cowexit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Destroys the cowsand chickens as they enter the
    trigger
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oCow = GetObjectByTag("q3_cow");
    object oCows = GetObjectByTag("q3_cows");
    object oChick = GetObjectByTag("q3_chicken");
    object oWay1 = GetNearestObjectByTag("q3_map_exit");

    if(GetEnteringObject()==oCow)
    {
        object oGord = GetObjectByTag("q2_thegord");
        AssignCommand(oCow,ClearAllActions());
        AssignCommand(oCow,ActionMoveToObject(oWay1));
        AssignCommand(oCow,ActionDoCommand(DestroyObject(OBJECT_SELF)));
        if(GetLocalInt(GetModule(), "OS_THEGORD_COWS") < 30)
        {
            SetLocalInt(GetModule(), "OS_THEGORD_COWS",30);
        }
    }
    else if(GetEnteringObject()==oCows)
    {
        AssignCommand(oCows,ClearAllActions());
        AssignCommand(oCows,ActionMoveToObject(oWay1));
        AssignCommand(oCows,ActionDoCommand(DestroyObject(OBJECT_SELF)));
    }
    else if (GetEnteringObject() == oChick)
    {
        AssignCommand(oCows,ClearAllActions());
        AssignCommand(oCows,ActionMoveToObject(oWay1));
        AssignCommand(oCows,ActionDoCommand(DestroyObject(OBJECT_SELF)));
    }
}
