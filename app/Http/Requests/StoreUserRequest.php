<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class StoreUserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true; // Public API
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'company_name' => ['required', 'string', 'max:255'],
            'first_name' => ['required', 'string', 'max:255'],
            'last_name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email', 'max:255', 'unique:users,email'],
            'phone' => [
                'required',
                'string',
                'regex:/^(\+90|0)?[0-9]{10}$/',
                'max:20',
                'unique:users,phone'
            ],
        ];
    }

    /**
     * Get custom error messages for validation rules
     */
    public function messages(): array
    {
        return [
            'company_name.required' => 'Firma adı zorunludur.',
            'company_name.string' => 'Firma adı metin formatında olmalıdır.',
            'company_name.max' => 'Firma adı en fazla 255 karakter olabilir.',

            'first_name.required' => 'Ad zorunludur.',
            'first_name.string' => 'Ad metin formatında olmalıdır.',
            'first_name.max' => 'Ad en fazla 255 karakter olabilir.',

            'last_name.required' => 'Soyad zorunludur.',
            'last_name.string' => 'Soyad metin formatında olmalıdır.',
            'last_name.max' => 'Soyad en fazla 255 karakter olabilir.',

            'email.required' => 'E-posta adresi zorunludur.',
            'email.email' => 'Geçerli bir e-posta adresi giriniz.',
            'email.unique' => 'Bu e-posta adresi zaten kullanımda.',
            'email.max' => 'E-posta adresi en fazla 255 karakter olabilir.',

            'phone.required' => 'Telefon numarası zorunludur.',
            'phone.regex' => 'Geçerli bir telefon numarası giriniz. (Örn: 05XXXXXXXXX veya +905XXXXXXXXX)',
            'phone.max' => 'Telefon numarası en fazla 20 karakter olabilir.',
            'phone.unique' => 'Bu telefon numarası zaten kullanımda.',
        ];
    }

    /**
     * Handle a failed validation attempt.
     */
    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(
            response()->json([
                'success' => false,
                'message' => 'Validation errors',
                'errors' => $validator->errors()
            ], 422)
        );
    }
}
