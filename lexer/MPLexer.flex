// import section
package lexer;

import java_cup.runtime.*;

%%
// declaration section
%class MPLexer

%cup

%line
%column

%eofval{
	return new Symbol( lexer.sym.EOF );
%eofval}

%{

   lexer.KWTable kwTable = new lexer.KWTable();
   Symbol getKW() {
      return new Symbol(kwTable.find(yytext()));
   }

   public int getLine()
   {
      return yyline;
   }
%}


//states
%state COMMENT

//macros
letter = [a-zA-Z]
digit = [0-9]

%%
// rules section
\/\/		{ yybegin(COMMENT); }
<COMMENT>~\n { yybegin(YYINITIAL); }

[ \t\r\n]+	{ /* ignore whitespace */ }

//operators
\=      { return new Symbol(lexer.sym.ASSIGNMENT); }
\+      { return new Symbol(lexer.sym.PLUS); }
\-      { return new Symbol(lexer.sym.MINUS); }
\*      { return new Symbol(lexer.sym.MULTIPLY); }
\/      { return new Symbol(lexer.sym.DIVIDE); }
\<      { return new Symbol(lexer.sym.LESS); }
\<=     { return new Symbol(lexer.sym.LESSEQUAL); }
\>      { return new Symbol(lexer.sym.GREATER); }
\>=     { return new Symbol(lexer.sym.GREATEREQUAL); }
\==     { return new Symbol(lexer.sym.EQUAL); }
\!=     { return new Symbol(lexer.sym.NOTEQUAL); }


//separators
\(      { return new Symbol(lexer.sym.LPAREN); }
\)      { return new Symbol(lexer.sym.RPAREN); }
\,      { return new Symbol(lexer.sym.COMMA); }
\:      { return new Symbol(lexer.sym.COLON); }
\{     { return new Symbol(lexer.sym.LBRACE); }
\}     { return new Symbol(lexer.sym.RBRACE); }

//keywords
{letter}+ { return getKW(); }

//id-s
{letter}({letter}|{digit})*	{ return new Symbol(lexer.sym.IDENTIFIER, yyline, yytext()); }

//constants
\'[^]\'			{ return new Symbol(lexer.sym.CHARCONST, yyline, new Character(yytext().charAt(1)));}
{digit}+		{ return new Symbol(lexer.sym.INTCONST, yyline, new Integer(yytext()));}

//error symbol
.		{ System.out.println( "ERROR: " + yytext() ); }

