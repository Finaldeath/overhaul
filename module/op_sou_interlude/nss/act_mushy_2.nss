//Set that PC asked Mushy to look for an item and take 100 gold.
void main()
{
    SetLocalInt(GetModule(),"X1_MUSHYSCROUNGE",1);
    SetLocalInt(GetPCSpeaker(),"X1_MUSHYSCROUNGE",1);
    TakeGoldFromCreature(100,GetPCSpeaker());
}

