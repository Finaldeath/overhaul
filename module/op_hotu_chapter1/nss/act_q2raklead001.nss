//::///////////////////////////////////////////////
//:: act_q2rakleader001
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets the SlavePlot Int on the Rakshasa leader to 10
     Player knows they are slaves, hasn't heard about portal or stone yet
     Will fire second start condition
*/

//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: June 25, 2003
//:://////////////////////////////////////////////
void main()
{
 SetLocalInt(GetModule(),"X2_Q2CSlavePlot",10);
}
