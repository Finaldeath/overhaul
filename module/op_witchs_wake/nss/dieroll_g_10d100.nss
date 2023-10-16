//::///////////////////////////////////////////////
//:: Die Roll: 10d100
//:: DieRoll_G_10d100.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a 10d100 broadcast string.
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
    int i1d100 = Random(100)+1;
    int i2d100 = Random(100)+1;
    int i3d100 = Random(100)+1;
    int i4d100 = Random(100)+1;
    int i5d100 = Random(100)+1;
    int i6d100 = Random(100)+1;
    int i7d100 = Random(100)+1;
    int i8d100 = Random(100)+1;
    int i9d100 = Random(100)+1;
    int i10d100 = Random(100)+1;
    int iTotal = i1d100 + i2d100 + i3d100 + i4d100 + i5d100 + i6d100 + i7d100 + i8d100 + i9d100 + i10d100;

    //Convert the rolls and totals to strings
    string s1d100 = IntToString(i1d100);
    string s2d100 = IntToString(i2d100);
    string s3d100 = IntToString(i3d100);
    string s4d100 = IntToString(i4d100);
    string s5d100 = IntToString(i5d100);
    string s6d100 = IntToString(i6d100);
    string s7d100 = IntToString(i7d100);
    string s8d100 = IntToString(i8d100);
    string s9d100 = IntToString(i9d100);
    string s10d100 = IntToString(i10d100);
    string sTotal = IntToString(iTotal);

    //Compile the string to be broadcast and save it out as a local
    string sBroadcast = sName+" rolls 10d100 ("+s1d100+", "+s2d100+", "+s3d100+", "+s4d100+", "+s5d100+", "+s6d100+", "+s7d100+", "+s8d100+", "+s9d100+", "+s10d100+"): TOTAL = "+sTotal+".";
    SetLocalString(oRoller, "DiceBagBroadcast", sBroadcast);
}
