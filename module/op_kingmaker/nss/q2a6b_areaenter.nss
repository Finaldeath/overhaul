//::///////////////////////////////////////////////
//:: q2a6b_areaenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if Feran should be in the militia room.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
void main()
{
    object oFeran = GetObjectByTag("q2_feran");
    object oWay = GetObjectByTag("q2a6b_way_feran");
    if (GetIsDay() == TRUE &&
      GetIsObjectValid(oFeran))
    {
        AssignCommand(oFeran,ActionJumpToObject(oWay));
        SetLocalInt(oFeran,"OS_FERANATBAR",0);
    }
}

