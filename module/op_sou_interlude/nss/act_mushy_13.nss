//Set that PC spoke to Mushy once already
void main()
{
    SetLocalInt(GetPCSpeaker(),"q5a_Jasmeena_Status",4);
    SetLocalInt(GetPCSpeaker(),"q5a_notojasmeena",2); // to avoid getting the "persuade" line again
    GiveGoldToCreature(GetPCSpeaker(),2000);
}

