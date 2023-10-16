//Give PC Calian Belt and take 40000 gold.
void main()
{
    CreateItemOnObject("q3_calianbelt",GetPCSpeaker());
    TakeGoldFromCreature(40000,GetPCSpeaker());
    SetLocalInt(GetPCSpeaker(),"X1_MUSHYSCROUNGE",2);
}
