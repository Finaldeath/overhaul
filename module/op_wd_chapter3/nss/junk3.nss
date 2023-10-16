// * decrementing number of locks
void main()
{
    SetLocalInt(GetModule(), "M3Q2FLOCKSREMAINING", GetLocalInt(GetModule(), "M3Q2FLOCKSREMAINING") -1);
    SpeakString(IntToString(GetLocalInt(GetModule(), "M3Q2FLOCKSREMAINING")));
}
