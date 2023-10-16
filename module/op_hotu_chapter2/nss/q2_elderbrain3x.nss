//::///////////////////////////////////////////////
//:: q2_elderbrain2x
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Set global to 3
   Player delivered mirror
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: Sept. 12, 2003
//:://////////////////////////////////////////////


void main()
{
    if (GetLocalInt(GetModule(),"elder_brain")<=3)
        {
        SetLocalInt(GetModule(),"elder_brain",3);
        }
}
