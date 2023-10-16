//::///////////////////////////////////////////////
//:: q2_elderbrain1x
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Set global to 1
   Player allowed to see Elder Brian
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: Sept. 12, 2003
//:://////////////////////////////////////////////


void main()
{
    if (GetLocalInt(GetModule(),"elder_brain")<=1)
        {
        SetLocalInt(GetModule(),"elder_brain",1);
        }
}
