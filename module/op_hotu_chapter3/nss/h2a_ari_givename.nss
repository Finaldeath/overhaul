//::///////////////////////////////////////////////
//:: Aribeth de Tylmarande, Give Name (Action Script)
//:: H2a_Ari_GiveName.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag the player as knowing Aribeth's name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 11, 2003
//:://////////////////////////////////////////////

void main()
{
    //Flag the Quest as being completed.
    SetLocalInt(GetModule(), "bAribethsNameKnown", TRUE);
    // Brent: September 2003.
    // Turn her surrender variable off, otherwise she'll never be able to fight properly
    SetLocalInt(OBJECT_SELF,"Generic_Surrender", FALSE);
    // Brad Prince: Oct 16, 2003.
    // Turn Immortal off here instead of in surrender so she can't be killed until she speaks.
    //SetImmortal(OBJECT_SELF, FALSE);
}
