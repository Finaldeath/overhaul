//::///////////////////////////////////////////////
//:: q6_Mirror10x
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Sets player knows about the shattered mirror
   (Main plot set to 10)
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: September 3, 2003
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(),"Mirror")<=10)
    {
    SetLocalInt(GetModule(),"Mirror",10);
    }
}
