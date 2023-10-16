//::///////////////////////////////////////////////
//:: Die Roll: 10d12
//:: DieRoll_G_10d12.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a 10d12 broadcast string.
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
    int i1d12 = Random(12)+1;
    int i2d12 = Random(12)+1;
    int i3d12 = Random(12)+1;
    int i4d12 = Random(12)+1;
    int i5d12 = Random(12)+1;
    int i6d12 = Random(12)+1;
    int i7d12 = Random(12)+1;
    int i8d12 = Random(12)+1;
    int i9d12 = Random(12)+1;
    int i10d12 = Random(12)+1;
    int iTotal = i1d12 + i2d12 + i3d12 + i4d12 + i5d12 + i6d12 + i7d12 + i8d12 + i9d12 + i10d12;

    //Convert the rolls and totals to strings
    string s1d12 = IntToString(i1d12);
    string s2d12 = IntToString(i2d12);
    string s3d12 = IntToString(i3d12);
    string s4d12 = IntToString(i4d12);
    string s5d12 = IntToString(i5d12);
    string s6d12 = IntToString(i6d12);
    string s7d12 = IntToString(i7d12);
    string s8d12 = IntToString(i8d12);
    string s9d12 = IntToString(i9d12);
    string s10d12 = IntToString(i10d12);
    string sTotal = IntToString(iTotal);

    //Compile the string to be broadcast and save it out as a local
    string sBroadcast = sName+" rolls 10d12 ("+s1d12+", "+s2d12+", "+s3d12+", "+s4d12+", "+s5d12+", "+s6d12+", "+s7d12+", "+s8d12+", "+s9d12+", "+s10d12+"): TOTAL = "+sTotal+".";
    SetLocalString(oRoller, "DiceBagBroadcast", sBroadcast);
}
