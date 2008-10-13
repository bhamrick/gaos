;FILE: idt.asm

section .text
global initialize_idt
extern make_entry
extern handler_entry_c
extern idt
%define IDT_SIZE 2047

%macro handler_entry_asm 1
global handler_entry%1
handler_entry%1:
	push edi
	push esi
	push edx
	push ecx
	push ebx
	push eax
	push dword %1
	call handler_entry_c
	add esp,28
	iret
%endmacro

%macro add_entry 1
push dword 0x8E
push dword 0x08
push handler_entry%1
push dword %1
call make_entry
add esp,16
%endmacro

handler_entry_asm 0
handler_entry_asm 1
handler_entry_asm 2
handler_entry_asm 3
handler_entry_asm 4
handler_entry_asm 5
handler_entry_asm 6
handler_entry_asm 7
handler_entry_asm 8
handler_entry_asm 9
handler_entry_asm 10
handler_entry_asm 11
handler_entry_asm 12
handler_entry_asm 13
handler_entry_asm 14
handler_entry_asm 15
handler_entry_asm 16
handler_entry_asm 17
handler_entry_asm 18
handler_entry_asm 19
handler_entry_asm 20
handler_entry_asm 21
handler_entry_asm 22
handler_entry_asm 23
handler_entry_asm 24
handler_entry_asm 25
handler_entry_asm 26
handler_entry_asm 27
handler_entry_asm 28
handler_entry_asm 29
handler_entry_asm 30
handler_entry_asm 31
handler_entry_asm 32
handler_entry_asm 33
handler_entry_asm 34
handler_entry_asm 35
handler_entry_asm 36
handler_entry_asm 37
handler_entry_asm 38
handler_entry_asm 39
handler_entry_asm 40
handler_entry_asm 41
handler_entry_asm 42
handler_entry_asm 43
handler_entry_asm 44
handler_entry_asm 45
handler_entry_asm 46
handler_entry_asm 47
handler_entry_asm 48
handler_entry_asm 49
handler_entry_asm 50
handler_entry_asm 51
handler_entry_asm 52
handler_entry_asm 53
handler_entry_asm 54
handler_entry_asm 55
handler_entry_asm 56
handler_entry_asm 57
handler_entry_asm 58
handler_entry_asm 59
handler_entry_asm 60
handler_entry_asm 61
handler_entry_asm 62
handler_entry_asm 63
handler_entry_asm 64
handler_entry_asm 65
handler_entry_asm 66
handler_entry_asm 67
handler_entry_asm 68
handler_entry_asm 69
handler_entry_asm 70
handler_entry_asm 71
handler_entry_asm 72
handler_entry_asm 73
handler_entry_asm 74
handler_entry_asm 75
handler_entry_asm 76
handler_entry_asm 77
handler_entry_asm 78
handler_entry_asm 79
handler_entry_asm 80
handler_entry_asm 81
handler_entry_asm 82
handler_entry_asm 83
handler_entry_asm 84
handler_entry_asm 85
handler_entry_asm 86
handler_entry_asm 87
handler_entry_asm 88
handler_entry_asm 89
handler_entry_asm 90
handler_entry_asm 91
handler_entry_asm 92
handler_entry_asm 93
handler_entry_asm 94
handler_entry_asm 95
handler_entry_asm 96
handler_entry_asm 97
handler_entry_asm 98
handler_entry_asm 99
handler_entry_asm 100
handler_entry_asm 101
handler_entry_asm 102
handler_entry_asm 103
handler_entry_asm 104
handler_entry_asm 105
handler_entry_asm 106
handler_entry_asm 107
handler_entry_asm 108
handler_entry_asm 109
handler_entry_asm 110
handler_entry_asm 111
handler_entry_asm 112
handler_entry_asm 113
handler_entry_asm 114
handler_entry_asm 115
handler_entry_asm 116
handler_entry_asm 117
handler_entry_asm 118
handler_entry_asm 119
handler_entry_asm 120
handler_entry_asm 121
handler_entry_asm 122
handler_entry_asm 123
handler_entry_asm 124
handler_entry_asm 125
handler_entry_asm 126
handler_entry_asm 127
handler_entry_asm 128
handler_entry_asm 129
handler_entry_asm 130
handler_entry_asm 131
handler_entry_asm 132
handler_entry_asm 133
handler_entry_asm 134
handler_entry_asm 135
handler_entry_asm 136
handler_entry_asm 137
handler_entry_asm 138
handler_entry_asm 139
handler_entry_asm 140
handler_entry_asm 141
handler_entry_asm 142
handler_entry_asm 143
handler_entry_asm 144
handler_entry_asm 145
handler_entry_asm 146
handler_entry_asm 147
handler_entry_asm 148
handler_entry_asm 149
handler_entry_asm 150
handler_entry_asm 151
handler_entry_asm 152
handler_entry_asm 153
handler_entry_asm 154
handler_entry_asm 155
handler_entry_asm 156
handler_entry_asm 157
handler_entry_asm 158
handler_entry_asm 159
handler_entry_asm 160
handler_entry_asm 161
handler_entry_asm 162
handler_entry_asm 163
handler_entry_asm 164
handler_entry_asm 165
handler_entry_asm 166
handler_entry_asm 167
handler_entry_asm 168
handler_entry_asm 169
handler_entry_asm 170
handler_entry_asm 171
handler_entry_asm 172
handler_entry_asm 173
handler_entry_asm 174
handler_entry_asm 175
handler_entry_asm 176
handler_entry_asm 177
handler_entry_asm 178
handler_entry_asm 179
handler_entry_asm 180
handler_entry_asm 181
handler_entry_asm 182
handler_entry_asm 183
handler_entry_asm 184
handler_entry_asm 185
handler_entry_asm 186
handler_entry_asm 187
handler_entry_asm 188
handler_entry_asm 189
handler_entry_asm 190
handler_entry_asm 191
handler_entry_asm 192
handler_entry_asm 193
handler_entry_asm 194
handler_entry_asm 195
handler_entry_asm 196
handler_entry_asm 197
handler_entry_asm 198
handler_entry_asm 199
handler_entry_asm 200
handler_entry_asm 201
handler_entry_asm 202
handler_entry_asm 203
handler_entry_asm 204
handler_entry_asm 205
handler_entry_asm 206
handler_entry_asm 207
handler_entry_asm 208
handler_entry_asm 209
handler_entry_asm 210
handler_entry_asm 211
handler_entry_asm 212
handler_entry_asm 213
handler_entry_asm 214
handler_entry_asm 215
handler_entry_asm 216
handler_entry_asm 217
handler_entry_asm 218
handler_entry_asm 219
handler_entry_asm 220
handler_entry_asm 221
handler_entry_asm 222
handler_entry_asm 223
handler_entry_asm 224
handler_entry_asm 225
handler_entry_asm 226
handler_entry_asm 227
handler_entry_asm 228
handler_entry_asm 229
handler_entry_asm 230
handler_entry_asm 231
handler_entry_asm 232
handler_entry_asm 233
handler_entry_asm 234
handler_entry_asm 235
handler_entry_asm 236
handler_entry_asm 237
handler_entry_asm 238
handler_entry_asm 239
handler_entry_asm 240
handler_entry_asm 241
handler_entry_asm 242
handler_entry_asm 243
handler_entry_asm 244
handler_entry_asm 245
handler_entry_asm 246
handler_entry_asm 247
handler_entry_asm 248
handler_entry_asm 249
handler_entry_asm 250
handler_entry_asm 251
handler_entry_asm 252
handler_entry_asm 253
handler_entry_asm 254
handler_entry_asm 255

initialize_idt:
	add_entry 0
	add_entry 1
	add_entry 2
	add_entry 3
	add_entry 4
	add_entry 5
	add_entry 6
	add_entry 7
	add_entry 8
	add_entry 9
	add_entry 10
	add_entry 11
	add_entry 12
	add_entry 13
	add_entry 14
	add_entry 15
	add_entry 16
	add_entry 17
	add_entry 18
	add_entry 19
	add_entry 20
	add_entry 21
	add_entry 22
	add_entry 23
	add_entry 24
	add_entry 25
	add_entry 26
	add_entry 27
	add_entry 28
	add_entry 29
	add_entry 30
	add_entry 31
	add_entry 32
	add_entry 33
	add_entry 34
	add_entry 35
	add_entry 36
	add_entry 37
	add_entry 38
	add_entry 39
	add_entry 40
	add_entry 41
	add_entry 42
	add_entry 43
	add_entry 44
	add_entry 45
	add_entry 46
	add_entry 47
	add_entry 48
	add_entry 49
	add_entry 50
	add_entry 51
	add_entry 52
	add_entry 53
	add_entry 54
	add_entry 55
	add_entry 56
	add_entry 57
	add_entry 58
	add_entry 59
	add_entry 60
	add_entry 61
	add_entry 62
	add_entry 63
	add_entry 64
	add_entry 65
	add_entry 66
	add_entry 67
	add_entry 68
	add_entry 69
	add_entry 70
	add_entry 71
	add_entry 72
	add_entry 73
	add_entry 74
	add_entry 75
	add_entry 76
	add_entry 77
	add_entry 78
	add_entry 79
	add_entry 80
	add_entry 81
	add_entry 82
	add_entry 83
	add_entry 84
	add_entry 85
	add_entry 86
	add_entry 87
	add_entry 88
	add_entry 89
	add_entry 90
	add_entry 91
	add_entry 92
	add_entry 93
	add_entry 94
	add_entry 95
	add_entry 96
	add_entry 97
	add_entry 98
	add_entry 99
	add_entry 100
	add_entry 101
	add_entry 102
	add_entry 103
	add_entry 104
	add_entry 105
	add_entry 106
	add_entry 107
	add_entry 108
	add_entry 109
	add_entry 110
	add_entry 111
	add_entry 112
	add_entry 113
	add_entry 114
	add_entry 115
	add_entry 116
	add_entry 117
	add_entry 118
	add_entry 119
	add_entry 120
	add_entry 121
	add_entry 122
	add_entry 123
	add_entry 124
	add_entry 125
	add_entry 126
	add_entry 127
	add_entry 128
	add_entry 129
	add_entry 130
	add_entry 131
	add_entry 132
	add_entry 133
	add_entry 134
	add_entry 135
	add_entry 136
	add_entry 137
	add_entry 138
	add_entry 139
	add_entry 140
	add_entry 141
	add_entry 142
	add_entry 143
	add_entry 144
	add_entry 145
	add_entry 146
	add_entry 147
	add_entry 148
	add_entry 149
	add_entry 150
	add_entry 151
	add_entry 152
	add_entry 153
	add_entry 154
	add_entry 155
	add_entry 156
	add_entry 157
	add_entry 158
	add_entry 159
	add_entry 160
	add_entry 161
	add_entry 162
	add_entry 163
	add_entry 164
	add_entry 165
	add_entry 166
	add_entry 167
	add_entry 168
	add_entry 169
	add_entry 170
	add_entry 171
	add_entry 172
	add_entry 173
	add_entry 174
	add_entry 175
	add_entry 176
	add_entry 177
	add_entry 178
	add_entry 179
	add_entry 180
	add_entry 181
	add_entry 182
	add_entry 183
	add_entry 184
	add_entry 185
	add_entry 186
	add_entry 187
	add_entry 188
	add_entry 189
	add_entry 190
	add_entry 191
	add_entry 192
	add_entry 193
	add_entry 194
	add_entry 195
	add_entry 196
	add_entry 197
	add_entry 198
	add_entry 199
	add_entry 200
	add_entry 201
	add_entry 202
	add_entry 203
	add_entry 204
	add_entry 205
	add_entry 206
	add_entry 207
	add_entry 208
	add_entry 209
	add_entry 210
	add_entry 211
	add_entry 212
	add_entry 213
	add_entry 214
	add_entry 215
	add_entry 216
	add_entry 217
	add_entry 218
	add_entry 219
	add_entry 220
	add_entry 221
	add_entry 222
	add_entry 223
	add_entry 224
	add_entry 225
	add_entry 226
	add_entry 227
	add_entry 228
	add_entry 229
	add_entry 230
	add_entry 231
	add_entry 232
	add_entry 233
	add_entry 234
	add_entry 235
	add_entry 236
	add_entry 237
	add_entry 238
	add_entry 239
	add_entry 240
	add_entry 241
	add_entry 242
	add_entry 243
	add_entry 244
	add_entry 245
	add_entry 246
	add_entry 247
	add_entry 248
	add_entry 249
	add_entry 250
	add_entry 251
	add_entry 252
	add_entry 253
	add_entry 254
	add_entry 255
	
	mov word [idtr],IDT_SIZE
	mov dword [idtr+2],idt
	lidt [idtr]
	ret

section .data
idtr:
	dw 0
	dd 0