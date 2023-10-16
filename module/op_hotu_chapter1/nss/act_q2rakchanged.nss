//::///////////////////////////////////////////////
//:: act_q2rakchanged
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets the Global Rakshasa variable to 99 - the Rakshasa will transform
     whenever conversation is aborted at this point
*/

//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: June 26, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(),"RakshasaChanged",99);
}
