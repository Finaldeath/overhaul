// Linu has been talked to at the inn, advance global by 2

void main()
{
    int nTalk = GetLocalInt(GetModule(), "q2a_Linu_Lives");
    SetLocalInt(GetModule(), "q2a_Linu_Lives",(nTalk + 2));
}


