//Give PC Calian Belt and take 35000 gold.
void main()
{
    CreateItemOnObject("q3_calianbelt",GetPCSpeaker());
    TakeGoldFromCreature(35000,GetPCSpeaker());
    SetLocalInt(GetPCSpeaker(),"X1_MUSHYSCROUNGE",2);
}
