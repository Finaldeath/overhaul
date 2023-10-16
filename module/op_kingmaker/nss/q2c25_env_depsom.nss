//::///////////////////////////////////////////////
//:: Deploy Elite Troops
//:: q2c25_env_depsom
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player chooses to deploy only a few elite troops
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "q_include"
void main()
{
    SetLocalInt(GetModule(), "OS_ENIVID_DEPLOY",20);
    os_DeploySome();
}
