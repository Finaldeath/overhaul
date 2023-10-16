// set it so the PC cannot ask about the crypt again

void main()
{
    SetLocalInt(GetPCSpeaker(), "q1foot_Know_Crypt", 2);
}
