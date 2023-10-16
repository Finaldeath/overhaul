//::///////////////////////////////////////////////
//:: q2aGrovel30x
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets  Grovel variable to 30
    Grovel working in inn
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On:   July 25, 2003
//:://////////////////////////////////////////////
void main()
{

    /*
    Grovel plot states:
    10 - Grovel sent up well
    20 - You have grovel put into a cage
    30 - you convince Durnan to put grovel to work at the inn
    99 - you have grovel executed
    */


    SetLocalInt(GetModule(),"Grovel",30);
}
