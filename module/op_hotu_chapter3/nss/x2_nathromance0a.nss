//::///////////////////////////////////////////////
//:: NathyrraRomance0a
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets main Nathyrra romance variable at 0
    (Romance killed)
    UNLESS ROMANCE VARIABLE is at 3
    (Romance forced)
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: Oct. 14, 2003
//:://////////////////////////////////////////////


void main()
{
 if (GetLocalInt(GetModule(),"iNathyrraRomance")!=3)
    {
    SetLocalInt(GetModule(),"iNathyrraRomance",0);
    }

}


