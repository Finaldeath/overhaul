//::///////////////////////////////////////////////
//:: Name h4c_gem_grab
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will create a gem on the PC and destroy
     the placeable.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 30, 2003
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        AssignCommand(GetLastUsedBy(), PlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 1.5));
        AssignCommand(GetLastUsedBy(), DelayCommand(1.2, PlaySound("it_jewelry")));
        CreateItemOnObject("hx_mimic_gem", GetLastUsedBy(), 1);
        DestroyObject(OBJECT_SELF);
    }
}
