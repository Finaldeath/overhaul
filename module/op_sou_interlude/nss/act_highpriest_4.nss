//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Mark Character as a god.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: April 9, 2003
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(GetPCSpeaker(),"X1_PCISGOD",10);
    SetLocalInt(GetModule(),"X1_HPSPOKE",10);
    SetLocalInt(GetModule(),"X1_NOMOREGODS",10);
}
