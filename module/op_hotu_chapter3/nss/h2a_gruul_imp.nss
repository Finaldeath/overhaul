//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Gru'ul Knows Imp In Grinder (Action Script)
//:: H2a_Gruul_Holid2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player tells Gru'ul that there's an imp in
     his grinder.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 28, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "bGruulKnowsImpInGrinder", TRUE);
}
