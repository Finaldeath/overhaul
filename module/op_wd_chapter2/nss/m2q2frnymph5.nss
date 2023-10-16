void main()
{
    object oSlave = GetObjectByTag("M2Q2H_SlaveFac");
    object oSlave2 = GetObjectByTag("M2Q2H_SlaveFac2");

    SetLocalInt(OBJECT_SELF,"NW_M2Q2NYMPH_NICE",20);
    SetLocalInt(GetArea(OBJECT_SELF),"NW_A_SlavesFree",10);
    AdjustReputation(GetPCSpeaker(),oSlave,100);
    AdjustReputation(GetPCSpeaker(),oSlave2,100);
}
