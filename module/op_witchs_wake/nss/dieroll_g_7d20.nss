//::///////////////////////////////////////////////
//:: Die Roll: 7d20
//:: DieRoll_G_7d20.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a 7d20 broadcast string.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 24, 2002
//:://////////////////////////////////////////////

void main()
{
    //Figure out who rolled the dice
    object oRoller = GetPCSpeaker();
    string sName = GetName(oRoller);

    //Roll the dice and tally them up
    int i1d20 = Random(20)+1;
    int i2d20 = Random(20)+1;
    int i3d20 = Random(20)+1;
    int i4d20 = Random(20)+1;
    int i5d20 = Random(20)+1;
    int i6d20 = Random(20)+1;
    int i7d20 = Random(20)+1;
    int iTotal = i1d20 + i2d20 + i3d20 + i4d20 + i5d20 + i6d20 + i7d20;

    //Convert the rolls and totals to strings
    string s1d20 = IntToString(i1d20);
    string s2d20 = IntToString(i2d20);
    string s3d20 = IntToString(i3d20);
    string s4d20 = IntToString(i4d20);
    string s5d20 = IntToString(i5d20);
    string s6d20 = IntToString(i6d20);
    string s7d20 = IntToString(i7d20);
    string sTotal = IntToString(iTotal);

    //Compile the string to be broadcast and save it out as a local
    string sBroadcast = sName+" rolls 7d20 ("+s1d20+", "+s2d20+", "+s3d20+", "+s4d20+", "+s5d20+", "+s6d20+", "+s7d20+"): TOTAL = "+sTotal+".";
    SetLocalString(oRoller, "DiceBagBroadcast", sBroadcast);
}
