//::///////////////////////////////////////////////
//:: Ellysia hates Feran
//:: act_ell_ferahate
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Ellysia hates Feran and will not speak to the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "OS_FERANLOVE",40);
    SetLocalInt(GetFirstPC(), "OS_ELLYSIA_MOOD",99);
}
